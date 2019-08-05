Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9124781913
	for <lists.iommu@lfdr.de>; Mon,  5 Aug 2019 14:22:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4698AE94;
	Mon,  5 Aug 2019 12:22:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 317C6E56
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 12:22:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EDB9D8A0
	for <iommu@lists.linux-foundation.org>;
	Mon,  5 Aug 2019 12:22:32 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id x15so29305379pgg.8
	for <iommu@lists.linux-foundation.org>;
	Mon, 05 Aug 2019 05:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D3yEsJczZk4ZuqdPDx5JLOGIqCT05A22pIoztZy5LD4=;
	b=rMyVun8jDU5nU4z8IENdJOaneaQw2J+d+Rg4cXCoDHJIjW1njTpAtZXF5GaEFM7YjW
	AIdf1IzEpBtCP6i2ZyH6JWV+KUbSr4xUv9P8ThS3WkjI2D07VeCBjG7glClOCfW7rlLJ
	4OGXgRd1fujoEHSLpOiXO/5IeIliDP4rCRWl8ikeaXrbKJETMzDdkwtbQVCFKxV01p1b
	wiu4xyCJyNK5sNHw+znCtjvNd68vVsdHS8iyOHr5YX0hSN1h3p5sqlA/iOaOBgideP8e
	ZkIzQ1JMkd6UV7W1H8JYhjhE52BADcEbWxMFjHr/H5jTm+L1cmsqe27IIB/wJm0oPzfc
	gTmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=D3yEsJczZk4ZuqdPDx5JLOGIqCT05A22pIoztZy5LD4=;
	b=O7VFeVfyhjwF4c6oMpZYVVt02UcidDcXSf9z7isYvHT0MlwyWo9onedYdc5X0MwuB8
	sTZdCQtt/pSsWbG+aBEbX9tqIeo5gohidzOoy83Gj5h7Jc/gfVzenIZajZ3cUO7TZPYb
	QB7GszooeZKS1w0wBzvp9DMyTl75KoCQbx50ioWeopMlepjp2c7d2wjWIaiQ7a09uUUN
	0BtCj1rjnw5yS2Z+yNBG27P/vjv62+xQYA/GoMMjk7PK1y4FsVEZRMegnAzx/qRKXLUO
	JGCcjqEVtkgYyVqIsxZB7uQ3q79KYYuFAeKsN/vrhvTXMDjuVqDTaZStfdJOb7IFJEvd
	kWYA==
X-Gm-Message-State: APjAAAU01bpt4UG3ksZ6e8WLalXEle74osBip4kfm2Cm5O7oSOYvtZHH
	E0ejGlcOIHlgpxR+1tvg39g=
X-Google-Smtp-Source: APXvYqwogI/fnXLqwAApMoBx9T/YLbLHBkEj2sYreLJgL7EsGb4NcAT0guXujrbqomzYJYPxPETjNQ==
X-Received: by 2002:a63:cc14:: with SMTP id x20mr90544477pgf.142.1565007752637;
	Mon, 05 Aug 2019 05:22:32 -0700 (PDT)
Received: from suzukaze.ipads-lab.se.sjtu.edu.cn ([89.31.126.54])
	by smtp.gmail.com with ESMTPSA id
	a12sm12472578pgv.48.2019.08.05.05.22.26
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Mon, 05 Aug 2019 05:22:32 -0700 (PDT)
From: Chuhong Yuan <hslester96@gmail.com>
To: 
Subject: [PATCH v3 1/8] dma: debug: Replace strncmp with str_has_prefix
Date: Mon,  5 Aug 2019 20:22:20 +0800
Message-Id: <20190805122220.12878-1-hslester96@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Chuhong Yuan <hslester96@gmail.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Development issues for Linux IOMMU support
	<iommu.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/iommu/>
List-Post: <mailto:iommu@lists.linux-foundation.org>
List-Help: <mailto:iommu-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/iommu>,
	<mailto:iommu-request@lists.linux-foundation.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

strncmp(str, const, len) is error-prone because len
is easy to have typo.
The example is the hard-coded len has counting error
or sizeof(const) forgets - 1.
So we prefer using newly introduced str_has_prefix()
to substitute such strncmp to make code better.

Signed-off-by: Chuhong Yuan <hslester96@gmail.com>
---
Changes in v3:
  - Revise the description.

 kernel/dma/debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 099002d84f46..0f9e1aba3e1a 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -970,7 +970,7 @@ static __init int dma_debug_cmdline(char *str)
 	if (!str)
 		return -EINVAL;
 
-	if (strncmp(str, "off", 3) == 0) {
+	if (str_has_prefix(str, "off")) {
 		pr_info("debugging disabled on kernel command line\n");
 		global_disable = true;
 	}
-- 
2.20.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
