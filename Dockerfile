FROM nfcore/base:1.8
LABEL authors="Bilge Sürün" \
      description="Docker image containing all software requirements for the nf-core/clinvap pipeline"

# Install the conda environment
COPY environment.yml /
RUN conda env create -f /environment.yml && conda clean -a

# Add conda installation dir to PATH (instead of doing 'conda activate')
ENV PATH /opt/conda/envs/nf-core-clinvap-1.0dev/bin:$PATH

# Dump the details of the installed packages to a file for posterity
RUN conda env export --name nf-core-clinvap-1.0dev > nf-core-clinvap-1.0dev.yml

ADD bin/docx_generate.py /usr/local/bin
RUN chmod 755 /usr/local/bin/docx_generate.py
