Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
	by mail.lfdr.de (Postfix) with ESMTPS id F104D36751E
	for <lists.iommu@lfdr.de>; Thu, 22 Apr 2021 00:25:34 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 47842400F2;
	Wed, 21 Apr 2021 22:25:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ke8gksDstRPM; Wed, 21 Apr 2021 22:25:32 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 637A7400DD;
	Wed, 21 Apr 2021 22:25:32 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37DC4C001A;
	Wed, 21 Apr 2021 22:25:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 0F936C000B
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 22:10:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2188402F7
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 22:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cze4YVNOZLRU for <iommu@lists.linux-foundation.org>;
 Wed, 21 Apr 2021 22:10:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 45DCA40310
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 22:10:40 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id p16so18493612plf.12
 for <iommu@lists.linux-foundation.org>; Wed, 21 Apr 2021 15:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkoDKXBORJsqE7IKc03ttO430VTwoSOVe4XRCyNvB4A=;
 b=MyKV7gdYb+FFVYLQH1QEe30v0Ta6kUT4h9YnS7QfRbI/gZtcN53j3MCJyz7zdwxk8n
 KKA42sJFBo142Z5CJPfHlcF9QSanKVJAnS3tRHQyY7YZYt62hssxFwXrbkLQL+e9G8Gs
 z5kFTivhkQmBM8QvvaXvUcpBvflxbIiViCO24aQGjuhlL9RfN9xBcqh4oPFYUPpljaAv
 tr7SVQ3hjj68885dBm4b/m4Hm7W8GimDJey2ZU9z1+6my/T+GLkI7Yg6guVxTSmsvtxF
 3rXfPn1lSrjf5G8mr7kF5E7Xz2AdRXBQTMhnGPXWune1Ur2uIJ+YSPO9SXMnL/Oxvitw
 k0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jkoDKXBORJsqE7IKc03ttO430VTwoSOVe4XRCyNvB4A=;
 b=OH6XQ2lNZ7oBAIx+LZ2SjZjPFHucwddmGv9/Sn0xmankqnBvw5udAgBA0c+1/oGGK/
 FZGumtgC/NHhqOv/jeOQH2eJqCIeo399EsRso0z53VsApWfhcGE+lJ1OdSZEmwhVgcGq
 Ti7QFw4hT2BAPcsS95q9/44c/HCfCDfB4dIIFgQ7pYc1acNDpnb+5yrlQ2f78i/qO5We
 WGnhbgrdJMzaEootQ7+l+AUoSnJ0t8TFxUOEp9WlSeigyVuVemXGVi9kzqXgKbiGxUvd
 Hxwji2q5skOQrpq13WHXbgHDkayw2XMHsKnWzKgFbA/9lFMlT+5Mb3plqi3cBeXzF7tY
 YmPQ==
X-Gm-Message-State: AOAM530BQnaBdkf6e574uFqupJvRcRu7sLvGcJ2MqTx/CBQRyQlKOYRO
 qXufyYA9YQh707LzDiS/dNQ=
X-Google-Smtp-Source: ABdhPJzpPgM6e3+a2yGIV98aPkPhua5zknl4irN8nKi5xP/IR5IHueVdGGGiPBEMYtgp6a2gT5nH9Q==
X-Received: by 2002:a17:902:8688:b029:ea:f782:5eae with SMTP id
 g8-20020a1709028688b02900eaf7825eaemr100027plo.15.1619043039754; 
 Wed, 21 Apr 2021 15:10:39 -0700 (PDT)
Received: from localhost.localdomain ([103.248.31.176])
 by smtp.googlemail.com with ESMTPSA id a16sm308965pgl.12.2021.04.21.15.10.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 15:10:39 -0700 (PDT)
From: Amey Narkhede <ameynarkhede03@gmail.com>
To: Rob Clark <robdclark@gmail.com>
Subject: [PATCH] iommu/qcom: Cleanup resources in case of probe error path
Date: Thu, 22 Apr 2021 03:40:30 +0530
Message-Id: <20210421221030.70647-1-ameynarkhede03@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 21 Apr 2021 22:25:30 +0000
Cc: Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
 Amey Narkhede <ameynarkhede03@gmail.com>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

If device registration fails, remove sysfs attribute
and if setting bus callbacks fails, unregister the device
and cleanup the sysfs attribute.

Signed-off-by: Amey Narkhede <ameynarkhede03@gmail.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 4294abe389b2..5fa128a1f7f0 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -850,10 +850,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	ret = iommu_device_register(&qcom_iommu->iommu, &qcom_iommu_ops, dev);
 	if (ret) {
 		dev_err(dev, "Failed to register iommu\n");
-		return ret;
+		goto err_sysfs_remove;
 	}

-	bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
+	ret = bus_set_iommu(&platform_bus_type, &qcom_iommu_ops);
+	if (ret)
+		goto err_unregister_device;

 	if (qcom_iommu->local_base) {
 		pm_runtime_get_sync(dev);
@@ -862,6 +864,14 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 	}

 	return 0;
+
+err_unregister_device:
+	iommu_device_unregister(&qcom_iommu->iommu);
+
+err_sysfs_remove:
+	iommu_device_sysfs_remove(&qcom_iommu->iommu);
+
+	return ret;
 }

 static int qcom_iommu_device_remove(struct platform_device *pdev)
--
2.31.1

I assume its ok to leave pm_runtime_enable in case of error.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
