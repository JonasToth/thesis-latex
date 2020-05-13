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

cat <<EOF
\begin{tabular}{bababab}
\toprule

\rowcolor{white} \null &
\textbf{Synthetic\$_{\mathbf{\mathcal{F}}}$} & \textbf{Synthetic\$_{\mathbf{\mathcal{\beta}}}$} &
\textbf{Lehrpfad\$_{\mathbf{\mathcal{F}}}$} & \textbf{Lehrpfad\$_{\mathbf{\mathcal{\beta}}}$} &
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

\bottomrule
\end{tabular}
EOF
