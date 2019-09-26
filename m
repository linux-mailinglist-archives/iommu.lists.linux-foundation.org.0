Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 919EDBF2F2
	for <lists.iommu@lfdr.de>; Thu, 26 Sep 2019 14:28:22 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 95EC01283;
	Thu, 26 Sep 2019 12:28:09 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 4AE661188
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:05:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id AE9B38A
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 12:05:24 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id r5so2138548wrm.12
	for <iommu@lists.linux-foundation.org>;
	Thu, 26 Sep 2019 05:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=hM8YfKOj/veQZGpRjHkC1Z8EKmrCYB/PVErpOmpXBBM=;
	b=lBuLbIw4VBqFeCaW65bXt3a9GvcgmPYUq/9I5AxJDVG/eQ9VtHShtO2zXx/zH0y/Ih
	bs1Cytd9GRcn16B4ghrrY1A3nkd1rtSvpC3GQCeC2aYAXw7o1kxquZxjxeWVz3t2ONos
	ym8Sv+6Ha/gpQPexDPsG95SJrV/v3ElbtlxM1YORNHm2uYqEGFJxrFViSmzqLey7DFZy
	1JvOZ/RY9M4pLxRHMjQSg9PEkmTC8cf8CokM8TO4dK4KXGmE923rUZDAOyPDe/bwAzcO
	Ne3NI3xkR3xjhvSXAC9EunpKM8hkqsTLMxyFw2P+qVJs2aSLdVkvZQDQrnlyH3xI3fD9
	FR0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=hM8YfKOj/veQZGpRjHkC1Z8EKmrCYB/PVErpOmpXBBM=;
	b=nPBcsaRsnFRfgALIrlZoDuUdT4RN+1ewZqAeNfFm56AnozepMjtPvx0rugAYfoaSfC
	NJyNwGoy1lNFEfHs8cH8+itHFXI11ZjftnaHiY2L9sKPV3dtlvpukPM5OdtuYJqVWXdL
	AmvlqdDR+r3EslWQ4m1odA4chiIaO/e3y+lNoo5UI+gD88oTXdjmKq+Ea6+oM53tosxI
	exjOMqXbEP7Z9Lhhp9rVD5nj1L16IxB4hI0gy7e5c/W/zwD/iPcYaNwVMxQ0rFzRkJjF
	c5xXfzmElxCa446jHI0Zajowzbol5WJTOn2M81MWWFqDY0DcDwfK7lKNheLPqk5H+33K
	Owkg==
X-Gm-Message-State: APjAAAUWV4hzid16Gwr+I5hICUhALBKioSuCGSlAaoLxgLiOZHPrIfcA
	ciFU89bc5/Ykc1jGM4VtkqI=
X-Google-Smtp-Source: APXvYqwoV1mUBUqMaCRaQReRjtFRL+Eof45k7bEWpHYlUxNeuRjc0LbO5xv8g1O5IYmkkn1VosjXJQ==
X-Received: by 2002:adf:e488:: with SMTP id i8mr2882218wrm.20.1569499523392;
	Thu, 26 Sep 2019 05:05:23 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([93.51.16.173])
	by smtp.gmail.com with ESMTPSA id
	d193sm5289584wmd.0.2019.09.26.05.05.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Sep 2019 05:05:22 -0700 (PDT)
From: kholk11@gmail.com
To: linux-arm-msm@vger.kernel.org
Subject: [PATCH 5/6] iommu/qcom: Index contexts by asid number to allow asid 0
Date: Thu, 26 Sep 2019 14:05:15 +0200
Message-Id: <20190926120516.4981-6-kholk11@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190926120516.4981-1-kholk11@gmail.com>
References: <20190926120516.4981-1-kholk11@gmail.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Thu, 26 Sep 2019 12:28:08 +0000
Cc: marijns95@gmail.com, iommu@lists.linux-foundation.org, agross@kernel.org,
	AngeloGioacchino Del Regno <kholk11@gmail.com>
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

This driver was indexing the contexts by asid-1, which is probably
done under the assumption that the first ASID is always 1.

Unfortunately this is not entirely true: at least in the MSM8956
and MSM8976 GPU IOMMU, the gpu_user context's ASID number is zero.
To allow using an asid number of zero, stop indexing the contexts
by asid-1 and rather index them by asid.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
---
 drivers/iommu/qcom_iommu.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 233ef496af27..03c68fe9439b 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -49,7 +49,7 @@ struct qcom_iommu_dev {
 	u32			 sec_id;
 	u8			 num_ctxs;
 	bool			 use_aarch64_pt;
-	struct qcom_iommu_ctx	*ctxs[0];   /* indexed by asid-1 */
+	struct qcom_iommu_ctx	*ctxs[0];   /* indexed by asid */
 };
 
 struct qcom_iommu_ctx {
@@ -87,7 +87,7 @@ static struct qcom_iommu_ctx * to_ctx(struct iommu_fwspec *fwspec, unsigned asid
 	struct qcom_iommu_dev *qcom_iommu = to_iommu(fwspec);
 	if (!qcom_iommu)
 		return NULL;
-	return qcom_iommu->ctxs[asid - 1];
+	return qcom_iommu->ctxs[asid];
 }
 
 static inline void
@@ -604,12 +604,10 @@ static int qcom_iommu_of_xlate(struct device *dev, struct of_phandle_args *args)
 	qcom_iommu = platform_get_drvdata(iommu_pdev);
 
 	/* make sure the asid specified in dt is valid, so we don't have
-	 * to sanity check this elsewhere, since 'asid - 1' is used to
-	 * index into qcom_iommu->ctxs:
+	 * to sanity check this elsewhere:
 	 */
-	if (WARN_ON(asid < 1) ||
-	    WARN_ON(asid > qcom_iommu->num_ctxs) ||
-	    WARN_ON(qcom_iommu->ctxs[asid - 1] == NULL))
+	if (WARN_ON(asid > qcom_iommu->num_ctxs) ||
+	    WARN_ON(qcom_iommu->ctxs[asid] == NULL))
 		return -EINVAL;
 
 	if (!fwspec->iommu_priv) {
@@ -789,7 +787,7 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 
 	dev_dbg(dev, "found asid %u\n", ctx->asid);
 
-	qcom_iommu->ctxs[ctx->asid - 1] = ctx;
+	qcom_iommu->ctxs[ctx->asid] = ctx;
 
 	return 0;
 }
@@ -801,7 +799,7 @@ static int qcom_iommu_ctx_remove(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, NULL);
 
-	qcom_iommu->ctxs[ctx->asid - 1] = NULL;
+	qcom_iommu->ctxs[ctx->asid] = NULL;
 
 	return 0;
 }
@@ -846,7 +844,8 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	for_each_child_of_node(dev->of_node, child)
 		max_asid = max(max_asid, get_asid(child));
 
-	sz = sizeof(*qcom_iommu) + (max_asid * sizeof(qcom_iommu->ctxs[0]));
+	sz = sizeof(*qcom_iommu);
+	sz += (max_asid + 1) * sizeof(qcom_iommu->ctxs[0]);
 
 	qcom_iommu = devm_kzalloc(dev, sz, GFP_KERNEL);
 	if (!qcom_iommu)
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
