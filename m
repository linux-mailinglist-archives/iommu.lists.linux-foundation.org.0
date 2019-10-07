Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C731CEE06
	for <lists.iommu@lfdr.de>; Mon,  7 Oct 2019 22:51:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A72C4EBE;
	Mon,  7 Oct 2019 20:51:27 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 9B5AEEBA
	for <iommu@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 20:51:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 43689604
	for <iommu@lists.linux-foundation.org>;
	Mon,  7 Oct 2019 20:51:25 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id i76so1777942pgc.0
	for <iommu@lists.linux-foundation.org>;
	Mon, 07 Oct 2019 13:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=6g6bAI8I8EYsK43cwBiTTXy4oB3NYybaiwTag+iFJPA=;
	b=rC3YTB0+hOcmaDXUspN39GIY0nApX+Rt/+I0TvKqqeA1Xaq9WCzVeeUHweQW7m6Pav
	VjVX19Qmr1nFoSTKu7/G6DQWha2WEgEh9X5NhuHzHKkws8lYbSCkIoU+t0BqIK7KBmpH
	2+6UkWqL088G7ZOhAa5TGMmTTT0fyUdlaVFSiVJuBYLnKPYCcW0VfSzNdZa62BKIpJuB
	qIexWIG7LzL9jmw5euiECych+ZLh6dexPW2I/F09tthZ/k8q3QBZcPsD7+GUiXJsTfr7
	x+74QhULu49un+22fuw0md1lVwbPHpRnJDYtVwgQFbqrXiVVhfXWf3NeOyUNTCGDScua
	NkJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=6g6bAI8I8EYsK43cwBiTTXy4oB3NYybaiwTag+iFJPA=;
	b=T3+Clnh3QbsrgtfB0zaPDEi3COr0DyTsWTzxADht7l863z4IJdlWDLGBc7ZxGpbTPq
	Z3pqTBMm0aicA0RzHJcMSF9MNv6Sxm/vDfw9Mw0xa52rKYwunqzbAxU33B9g49fXvLRt
	xKbfF9hkfUg0RD9ZOAnaKrTyuBccbqEg47YPD2uDnnuNRnJAzaIsfwb+Pc6WCf5tPzOk
	CWloEe2ISCbbCVlZXSgWt3I/v048jSiV5tpzZebAdsD5BBCVK4BhJXzUim7oB7OI6l4s
	1O0fftQRG27lLss47ttafXaL7Ge4omiE1xKMSyTJm0k7tORx76QFMFaCp7F7+X9oom3P
	7iUw==
X-Gm-Message-State: APjAAAWiq35WrfSI9gSheZYpt71WDasCDtvkYoo1++od8ksUgPYXFJY7
	GOHNDXo20u5E0BP41jjpTQQUqwMK
X-Google-Smtp-Source: APXvYqy3GawUaKDtynbkxOmrvUe78E4CqvoIysRE+NXAUd0BUstCS0iAwnenFUJnuEigjkBPuOqTiw==
X-Received: by 2002:a63:60e:: with SMTP id 14mr5830612pgg.179.1570481484414;
	Mon, 07 Oct 2019 13:51:24 -0700 (PDT)
Received: from localhost ([100.118.89.196]) by smtp.gmail.com with ESMTPSA id
	e192sm17789132pfh.83.2019.10.07.13.51.23
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 07 Oct 2019 13:51:23 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2] iommu/arm-smmu: fix "hang" when games exit
Date: Mon,  7 Oct 2019 13:49:06 -0700
Message-Id: <20191007204906.19571-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
References: <418d8426-f299-1269-2b2e-f86677cf22c2@arm.com>
MIME-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>, Will Deacon <will@kernel.org>,
	freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, "moderated list:ARM SMMU DRIVERS"
	<linux-arm-kernel@lists.infradead.org>
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

From: Rob Clark <robdclark@chromium.org>

When games, browser, or anything using a lot of GPU buffers exits, there
can be many hundreds or thousands of buffers to unmap and free.  If the
GPU is otherwise suspended, this can cause arm-smmu to resume/suspend
for each buffer, resulting 5-10 seconds worth of reprogramming the
context bank (arm_smmu_write_context_bank()/arm_smmu_write_s2cr()/etc).
To the user it would appear that the system just locked up.

A simple solution is to use pm_runtime_put_autosuspend() instead, so we
don't immediately suspend the SMMU device.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v1: original
v2: unconditionally use autosuspend, rather than deciding based on what
    consumer does

 drivers/iommu/arm-smmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/arm-smmu.c b/drivers/iommu/arm-smmu.c
index 3f1d55fb43c4..b7b41f5001bc 100644
--- a/drivers/iommu/arm-smmu.c
+++ b/drivers/iommu/arm-smmu.c
@@ -289,7 +289,7 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 {
 	if (pm_runtime_enabled(smmu->dev))
-		pm_runtime_put(smmu->dev);
+		pm_runtime_put_autosuspend(smmu->dev);
 }
 
 static struct arm_smmu_domain *to_smmu_domain(struct iommu_domain *dom)
@@ -1445,6 +1445,9 @@ static int arm_smmu_attach_dev(struct iommu_domain *domain, struct device *dev)
 	/* Looks ok, so add the device to the domain */
 	ret = arm_smmu_domain_add_master(smmu_domain, fwspec);
 
+	pm_runtime_set_autosuspend_delay(smmu->dev, 20);
+	pm_runtime_use_autosuspend(smmu->dev);
+
 rpm_put:
 	arm_smmu_rpm_put(smmu);
 	return ret;
-- 
2.21.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
