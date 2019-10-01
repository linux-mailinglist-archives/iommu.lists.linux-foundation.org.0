Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 69CB5C39A1
	for <lists.iommu@lfdr.de>; Tue,  1 Oct 2019 17:57:21 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id C128E1BAD;
	Tue,  1 Oct 2019 15:57:13 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 1850B1A27
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 15:56:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 85988A3
	for <iommu@lists.linux-foundation.org>;
	Tue,  1 Oct 2019 15:56:51 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id v8so16216805wrt.2
	for <iommu@lists.linux-foundation.org>;
	Tue, 01 Oct 2019 08:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hteX5Po5jH9mp6pG+BqMJxAmFHZvrUZhbwHbRe2F5fc=;
	b=aKzXzm76HfjoXhv0IEyTeJT5jxxYKt/jbPKhPL0uETwbxPaz+J1kM9JhoifyzvY8WL
	QTWuiBd8l8mWnQP8GIQf56FGbZvPUAqyHIShSrxU2x2m9pZ6B5i/F6CKEKQvc8PXV2dp
	tfp4QUaNVbPXqRatm4T8PTERR6FXzgqpsjEMFElQ7qKKUuOb2Hvah6pcubK5bd8meCgz
	ME2JuTwuUTGwczbuTDY+SjBxumgxYR4EIRv2Dp/zUXcBCcIVcJTN1asUyI2cuxkIdCrc
	eTFfOI8tFhkYj/2lTlUeqbiT1H5nFyZrUmDplrtA4Jn2y0LKrX472/KGyQJGx4ezqFNh
	tzLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hteX5Po5jH9mp6pG+BqMJxAmFHZvrUZhbwHbRe2F5fc=;
	b=t0VtySveKige8Mgg87I9u9Y+OfJ4INHqw5I34Asu5aGn93u/D+cfYKytyDUCDljCMz
	DcPgB6I6lnKHYQsrUl9ZKAkpb4Dp4nAksw3mxD6qw9KLXdTgx6D4HgrwqKbRNjfrJnWP
	0VPv/y7pY84MDXyPhVCYhgP3keufWbMt+YaDqoe4XR0LIRD17yXUKrUCphFskMqbiTBp
	gIqLHTKfXAhe0bMWF5QluwMhI77KN+PHudnhg7UgEF4JbzcIAc+q2nlG9IakvYakPYiO
	gM8wRsvA2DwB0TYVJniZqP9vkXrt3HG37Uo5mfXZsts7ssiSfqDwyNZuw1lYBT3OSvkV
	nGQw==
X-Gm-Message-State: APjAAAXdZXMieD6UPO3QJMxad6gy1bDx79diyQJecGdgNAy/XNmjCQKj
	e2cKbziiNPiI2URv7mwJZ5U=
X-Google-Smtp-Source: APXvYqx5gg7wLTncQSXDPIHGvIRYQdrcUmR+eKSlpt2JGc3eEGQ2cWL9tMeEsLIxSZd5DP+t0waoLQ==
X-Received: by 2002:a5d:5352:: with SMTP id t18mr19212910wrv.72.1569945410017; 
	Tue, 01 Oct 2019 08:56:50 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	h63sm6209136wmf.15.2019.10.01.08.56.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 01 Oct 2019 08:56:48 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH v3 2/7] iommu/qcom: Use the asid read from device-tree if
	specified
Date: Tue,  1 Oct 2019 17:56:36 +0200
Message-Id: <20191001155641.37117-3-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191001155641.37117-1-kholk11@gmail.com>
References: <20191001155641.37117-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: marijns95@gmail.com, iommu@lists.linux-foundation.org, agross@kernel.org,
	kholk11@gmail.com
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

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

As specified in this driver, the context banks are 0x1000 apart.
Problem is that sometimes the context number (our asid) does not
match this logic and we end up using the wrong one: this starts
being a problem in the case that we need to send TZ commands
to do anything on a specific context.

For this reason, read the ASID from the DT if the property
"qcom,ctx-num" is present on the IOMMU context node.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 .../devicetree/bindings/iommu/qcom,iommu.txt    |  1 +
 drivers/iommu/qcom_iommu.c                      | 17 ++++++++++++++---
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
index 059139abce35..ba0b77889f02 100644
--- a/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
+++ b/Documentation/devicetree/bindings/iommu/qcom,iommu.txt
@@ -46,6 +46,7 @@ to non-secure vs secure interrupt line.
                      for routing of context bank irq's to secure vs non-
                      secure lines.  (Ie. if the iommu contains secure
                      context banks)
+- qcom,ctx-num     : The number associated to the context bank
 
 
 ** Examples:
diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index c31e7bc4ccbe..504ca69adc5a 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -585,7 +585,8 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	 * index into qcom_iommu->ctxs:
 	 */
 	if (WARN_ON(asid < 1) ||
-	    WARN_ON(asid > qcom_iommu->num_ctxs))
+	    WARN_ON(asid > qcom_iommu->num_ctxs) ||
+	    WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
 		return -EINVAL;
 
 	if (!fwspec->iommu_priv) {
@@ -693,7 +694,8 @@ static int qcom_iommu_sec_ptbl_init(struct device *dev)
 
 static int get_asid(const struct device_node *np)
 {
-	u32 reg;
+	u32 reg, val;
+	int asid;
 
 	/* read the "reg" property directly to get the relative address
 	 * of the context bank, and calculate the asid from that:
@@ -701,7 +703,16 @@ static int get_asid(const struct device_node *np)
 	if (of_property_read_u32_index(np, "reg", 0, &reg))
 		return -ENODEV;
 
-	return reg / 0x1000;      /* context banks are 0x1000 apart */
+	/* Context banks are 0x1000 apart but, in some cases, the ASID
+	 * number doesn't match to this logic and needs to be passed
+	 * from the DT configuration explicitly.
+	 */
+	if (of_property_read_u32(np, "qcom,ctx-num", &val))
+		asid = reg / 0x1000;
+	else
+		asid = val;
+
+	return asid;
 }
 
 static int qcom_iommu_ctx_probe(struct platform_device *pdev)
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
