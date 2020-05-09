Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F8F1CC364
	for <lists.iommu@lfdr.de>; Sat,  9 May 2020 19:55:50 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2A87F87951;
	Sat,  9 May 2020 17:55:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DNzCM3eyBDkQ; Sat,  9 May 2020 17:55:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id CBEA88796B;
	Sat,  9 May 2020 17:55:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C5824C07FF;
	Sat,  9 May 2020 17:55:47 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2AFC6C07FF
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 13:08:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1982688A18
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 13:08:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mE+d0gHBHixD for <iommu@lists.linux-foundation.org>;
 Sat,  9 May 2020 13:08:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
 [209.85.210.193])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 62EB6886EA
 for <iommu@lists.linux-foundation.org>; Sat,  9 May 2020 13:08:58 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id f7so2422767pfa.9
 for <iommu@lists.linux-foundation.org>; Sat, 09 May 2020 06:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=tpvIu9pcOwiZbdHf6pux4XnkT8udv6zekLOd+SK979M=;
 b=rJhyUkrYZ3RmXJD/52orkzxJL/BP+q8ktlC2WADmuvtVxA3cN8hDf/tsuRzD/njOvL
 BHQLhpUfu9oxNLBvQULDoiC9ATqShBVE/+KZeg4bvVw8pIIM1c9DvTePPhI5oHQSv6Y7
 SvMdM53bbBYhKQxky2GCfeFwI5vuStPZbOvgAax9/YaNY/l/LuZ1yfPLe3k0FqimNF0m
 woiM/L5h5EjN5Ke4HWc0MQT6XMrzxRjhUzQwBA0iKc8NqJfN7xmuXrfzYu8Oq/vVZftq
 mhyIoLjuF9cz8lUNgQsDnRJQeP31M+jmeJp3fvav+OnV0YY+wBfo9JPd4lIKolqtItBu
 MGYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=tpvIu9pcOwiZbdHf6pux4XnkT8udv6zekLOd+SK979M=;
 b=WjxZZmZXCAD8vHE2WBS7AJgjT+g7wxIJmR041ZXODaxHCtqG/VHESptMvP6GJr80iy
 ogPaBSpV8do8/Irp+O1bxIJNvVaOyZG+BRWj5Luhj1XbCp/L3AnAN5NQtglJ7sEqk8IW
 W4v+ZmZ9Q3aK3vrcR2rHCDb7S4JZF9W/HZUN+BQs992GYJQe3exXUFAy8yHqcuIQ5DMJ
 +A6+u6ggBBoSVfWMU8Vq7QKlnXDeBpEhXgDve6/cG3HYRc6hspSmCr4Z9vXwGvYag+52
 +66PtOZbGG03gIBR7pK9nqX3mRPvdwNyVv/jTkxcsRdOuzH9E3eAmS2oq8e8MGo1ERRd
 GNEA==
X-Gm-Message-State: AGi0PuZzL/gChbEtawaHH4oQN68XRdQwO7ZOu8J5u36wcigjF/hd5LO7
 78YhtKqcEsRwR5Q5qqslr7Sd9g==
X-Google-Smtp-Source: APiQypJbFhAvXpUMh7O5IanP0e3Ci5MI661K8ttEJj4RMHlcFynTPtLeJ1jGd6Nk6w17VjghMlE5sg==
X-Received: by 2002:aa7:9904:: with SMTP id z4mr7805510pff.38.1589029737940;
 Sat, 09 May 2020 06:08:57 -0700 (PDT)
Received: from localhost.localdomain ([80.251.214.228])
 by smtp.gmail.com with ESMTPSA id 9sm3612103pgr.17.2020.05.09.06.08.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 May 2020 06:08:57 -0700 (PDT)
From: Shawn Guo <shawn.guo@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Joerg Roedel <joro@8bytes.org>
Subject: [PATCH] iommu/qcom: add optional clock for TLB invalidate
Date: Sat,  9 May 2020 21:08:25 +0800
Message-Id: <20200509130825.28248-1-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
X-Mailman-Approved-At: Sat, 09 May 2020 17:55:46 +0000
Cc: linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@gmail.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, iommu@lists.linux-foundation.org,
 Andy Gross <agross@kernel.org>, Shawn Guo <shawn.guo@linaro.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On some SoCs like MSM8939 with A405 adreno, there is a gfx_tbu clock
needs to be on while doing TLB invalidate. Otherwise, TLBSYNC status
will not be correctly reflected, causing the system to go into a bad
state.  Add it as an optional clock, so that platforms that have this
clock can pass it over DT.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 drivers/iommu/qcom_iommu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/iommu/qcom_iommu.c b/drivers/iommu/qcom_iommu.c
index 0e2a96467767..2f6c6da7d540 100644
--- a/drivers/iommu/qcom_iommu.c
+++ b/drivers/iommu/qcom_iommu.c
@@ -45,6 +45,7 @@ struct qcom_iommu_dev {
 	struct device		*dev;
 	struct clk		*iface_clk;
 	struct clk		*bus_clk;
+	struct clk		*tlb_clk;
 	void __iomem		*local_base;
 	u32			 sec_id;
 	u8			 num_ctxs;
@@ -643,11 +644,20 @@ static int qcom_iommu_enable_clocks(struct qcom_iommu_dev *qcom_iommu)
 		return ret;
 	}
 
+	ret = clk_prepare_enable(qcom_iommu->tlb_clk);
+	if (ret) {
+		dev_err(qcom_iommu->dev, "Couldn't enable tlb_clk\n");
+		clk_disable_unprepare(qcom_iommu->bus_clk);
+		clk_disable_unprepare(qcom_iommu->iface_clk);
+		return ret;
+	}
+
 	return 0;
 }
 
 static void qcom_iommu_disable_clocks(struct qcom_iommu_dev *qcom_iommu)
 {
+	clk_disable_unprepare(qcom_iommu->tlb_clk);
 	clk_disable_unprepare(qcom_iommu->bus_clk);
 	clk_disable_unprepare(qcom_iommu->iface_clk);
 }
@@ -839,6 +849,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 		return PTR_ERR(qcom_iommu->bus_clk);
 	}
 
+	qcom_iommu->tlb_clk = devm_clk_get(dev, "tlb");
+	if (IS_ERR(qcom_iommu->tlb_clk)) {
+		dev_dbg(dev, "failed to get tlb clock\n");
+		qcom_iommu->tlb_clk = NULL;
+	}
+
 	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
 				 &qcom_iommu->sec_id)) {
 		dev_err(dev, "missing qcom,iommu-secure-id property\n");
-- 
2.17.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
