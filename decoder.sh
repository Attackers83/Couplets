HOME_DIR=$(cd `dirname $0`; pwd)

CODE_DIR=${HOME_DIR}/tensor2tensor
export PYTHONPATH=${CODE_DIR}:${PYTHONPATH}
binFile=${CODE_DIR}/tensor2tensor/bin

TRAIN_DIR=${HOME_DIR}/output
LOG_DIR=${HOME_DIR}/output/log
USR_DIR=${HOME_DIR}/data
DATA_DIR=${HOME_DIR}/data

PROBLEM=translate_up2down
MODEL=transformer
HPARAMS_SET=transformer_small
#HPARAMS_SET=transformer_base

mkdir -p ${TRAIN_DIR} ${LOG_DIR}

setting=default

python3.6 ${binFile}/t2t-decoder \
--t2t_usr_dir=${USR_DIR} \
--problem=${PROBLEM} \
--data_dir=${DATA_DIR} \
--model=${MODEL} \
--hparams_set=${HPARAMS_SET} \
--output_dir=${TRAIN_DIR} \
--decode_hparams="beam_size=4,alpha=0.6" \
--decode_from_file=decoder/q.txt \
--decode_to_file=${HOME_DIR}/decoder/a.txt
