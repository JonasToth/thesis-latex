#!/usr/bin/env sh

keypoint_count() {
    sed -ne 's/count: \(\w\+\)$/\1/p' "${1}/${2}_keypoint_stat.yml" | tr -d ' ' | head -n1
}
correspondence_count() {
    sed -ne 's/relevant_elements: \(\w\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1
}
tp_count() {
    sed -ne 's/true_positives: \(\w\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1
}
fp_count() {
    sed -ne 's/false_positives: \(\w\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1
}
fn_count() {
    sed -ne 's/false_negatives: \(\w\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1
}
precision() {
    sed -ne 's/precision: \(.\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1 | awk -F"E" 'BEGIN{OFMT="%.3f"} {print $1 * (10 ^ $2)}'
}
recall() {
    sed -ne 's/recall: \(.\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1 | awk -F"E" 'BEGIN{OFMT="%.3f"} {print $1 * (10 ^ $2)}'
}
youden() {
    sed -ne 's/youden_index: \(.\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1 | awk -F"E" 'BEGIN{OFMT="%.3f"} {print $1 * (10 ^ $2)}'
}
accuracy() {
    sed -ne 's/rand_index: \(.\+\)$/\1/p' "${1}/${2}_recognition.yml" | tr -d ' ' | head -n1 | awk -F"E" 'BEGIN{OFMT="%.3f"} {print $1 * (10 ^ $2)}'
}

cat <<EOF
\begin{tabular}{bababab}
\toprule

\rowcolor{white} \null &
\textbf{Synthetic\$_{\mathbf{\mathcal{F}}}$} & \textbf{Synthetic\$_{\mathbf{\mathcal{\beta}}}$} &
\textbf{Mine\$_{\mathbf{\mathcal{F}}}$} & \textbf{Mine\$_{\mathbf{\mathcal{\beta}}}$} &
\textbf{Office\$_{\mathbf{\mathcal{F}}}$} & \textbf{Office\$_{\mathbf{\mathcal{\beta}}}$} \\\\
\midrule

\rowcolor{lightgray}
\textbf{Keypoint Count} &
    \num{$(keypoint_count flexion synthetic)} & \num{$(keypoint_count bearing synthetic)} &
    \num{$(keypoint_count flexion lehrpfad)} & \num{$(keypoint_count bearing lehrpfad)} &
    \num{$(keypoint_count flexion office)} & \num{$(keypoint_count bearing office)} \\\\
\textbf{Correspondences} &
    \num{$(correspondence_count flexion synthetic)} & \num{$(correspondence_count bearing synthetic)} &
    \num{$(correspondence_count flexion lehrpfad)} & \num{$(correspondence_count bearing lehrpfad)} &
    \num{$(correspondence_count flexion office)} & \num{$(correspondence_count bearing office)} \\\\
\rowcolor{lightgray}
\textbf{True Positives} &
    \num{$(tp_count flexion synthetic)} & \num{$(tp_count bearing synthetic)} &
    \num{$(tp_count flexion lehrpfad)} & \num{$(tp_count bearing lehrpfad)} &
    \num{$(tp_count flexion office)} & \num{$(tp_count bearing office)} \\\\
\textbf{False Positives} &
    \num{$(fp_count flexion synthetic)} & \num{$(fp_count bearing synthetic)} &
    \num{$(fp_count flexion lehrpfad)} & \num{$(fp_count bearing lehrpfad)} &
    \num{$(fp_count flexion office)} & \num{$(fp_count bearing office)} \\\\
\rowcolor{lightgray}
\textbf{False Negatives} &
    \num{$(fn_count flexion synthetic)} & \num{$(fn_count bearing synthetic)} &
    \num{$(fn_count flexion lehrpfad)} & \num{$(fn_count bearing lehrpfad)} &
    \num{$(fn_count flexion office)} & \num{$(fn_count bearing office)} \\\\
\textbf{Precision} &
    \num{$(precision flexion synthetic)} & \num{$(precision bearing synthetic)} &
    \num{$(precision flexion lehrpfad)} & \num{$(precision bearing lehrpfad)} &
    \num{$(precision flexion office)} & \num{$(precision bearing office)} \\\\
\rowcolor{lightgray}
\textbf{Recall} &
    \num{$(recall flexion synthetic)} & \num{$(recall bearing synthetic)} &
    \num{$(recall flexion lehrpfad)} & \num{$(recall bearing lehrpfad)} &
    \num{$(recall flexion office)} & \num{$(recall bearing office)} \\\\
\textbf{Youden's index} &
    \num{$(youden flexion synthetic)} & \num{$(youden bearing synthetic)} &
    \num{$(youden flexion lehrpfad)} & \num{$(youden bearing lehrpfad)} &
    \num{$(youden flexion office)} & \num{$(youden bearing office)} \\\\
\rowcolor{lightgray}
\textbf{Accuracy} &
    \num{$(accuracy flexion synthetic)} & \num{$(accuracy bearing synthetic)} &
    \num{$(accuracy flexion lehrpfad)} & \num{$(accuracy bearing lehrpfad)} &
    \num{$(accuracy flexion office)} & \num{$(accuracy bearing office)} \\\\
\bottomrule
\end{tabular}
EOF
