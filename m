Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A8F2EF456
	for <lists.iommu@lfdr.de>; Fri,  8 Jan 2021 16:02:41 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 9E87887321;
	Fri,  8 Jan 2021 15:02:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YDSQjryMpF2E; Fri,  8 Jan 2021 15:02:38 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id AA6828732E;
	Fri,  8 Jan 2021 15:02:38 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9652DC013A;
	Fri,  8 Jan 2021 15:02:38 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6F829C013A
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 5C5F686DDB
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id moMgG0Dkvs4I for <iommu@lists.linux-foundation.org>;
 Fri,  8 Jan 2021 15:02:36 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 78CBB86DDA
 for <iommu@lists.linux-foundation.org>; Fri,  8 Jan 2021 15:02:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id c133so8050938wme.4
 for <iommu@lists.linux-foundation.org>; Fri, 08 Jan 2021 07:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6eMatyaU8zFd8Q8TvQc5SNMWc7sFi+EMVDUCvYNO8HI=;
 b=PF+LtOue9z0k3+oGC/sV5vRzeVgpjnE66dv2lS1/0KAh6PdcDcb/eiy37cF0YSw7tR
 XamqKOvs/tvWlbeQMist5W2NOqYEP+DQrOLDcyMMWBGWnTGIbB7jRFkZYp2PJUmaAk5X
 9ZNyT4OrLBxIV8rTB1uhyk4ubLRlzCNYE9TGknq19Iu/r98UGfCTUWQU4RhOiQFvYsuC
 UHhAmgUFXWWV8nlVOLzJNpjmHVmovdXXeY6I5cASBrJxD+S17acG+4oscZrctbysrux5
 GJV8LXQdfWgJTatHEY+Q3AgLBuECirtQlEnsNdWT5PSeyPBtzBgy79fPiBriSzLmRaf0
 wh1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6eMatyaU8zFd8Q8TvQc5SNMWc7sFi+EMVDUCvYNO8HI=;
 b=iVDxNsGILnwkFbdE3b3G2mPw9dvv5gabco9tfjj+kfk3UKNost0jQ/eFLnUYqvmkAz
 QAfKDW7tqqNRzUlZyeaB7w6eknMS8XptprJveOlyNQXOVOIfds9lB375BliJ+UwOoHeC
 Ysng7J/krayO0+hmUkly5hEIoZ9as2jX+Gbpz/251RK2irwWFjbBlLfUN2RuSqd2oyIg
 f/gJs9n0jaKOopx6w35OUrPdHcEis78IQQz5YK7y1jFadGDDk2SX86xUFi9srLVfrTDr
 j1yjxdv0oFYeIvcdWB2RIeExHu3QFbwrcJuKgIF/YleRuzZyb4gty2llsiw8Qyie5Gph
 mjmQ==
X-Gm-Message-State: AOAM533qupbGFPTg7D5nkP+Yh9v5uaXQmgOGeMsge9QUELQBt2Kh80io
 YQXQiWP543QOiyOpUsTZFPteWw==
X-Google-Smtp-Source: ABdhPJyHiNU1Qbdu42iiC2mX+tJD+USpt5tm+a/xmIdCmwoy1ECY/HXmB0eN9hveoKs5yMklN1nRqw==
X-Received: by 2002:a7b:c8cd:: with SMTP id f13mr3294358wml.56.1610118154929; 
 Fri, 08 Jan 2021 07:02:34 -0800 (PST)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id s13sm14258464wra.53.2021.01.08.07.02.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jan 2021 07:02:34 -0800 (PST)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: joro@8bytes.org,
	will@kernel.org
Subject: [PATCH v9 05/10] uacce: Enable IOMMU_DEV_FEAT_IOPF
Date: Fri,  8 Jan 2021 15:52:13 +0100
Message-Id: <20210108145217.2254447-6-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210108145217.2254447-1-jean-philippe@linaro.org>
References: <20210108145217.2254447-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: vivek.gautam@arm.com, guohanjun@huawei.com,
 Jean-Philippe Brucker <jean-philippe@linaro.org>, linux-acpi@vger.kernel.org,
 zhangfei.gao@linaro.org, lenb@kernel.org, devicetree@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>, robh+dt@kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rjw@rjwysocki.net,
 iommu@lists.linux-foundation.org, sudeep.holla@arm.com, robin.murphy@arm.com,
 linux-accelerators@lists.ozlabs.org
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

The IOPF (I/O Page Fault) feature is now enabled independently from the
SVA feature, because some IOPF implementations are device-specific and
do not require IOMMU support for PCIe PRI or Arm SMMU stall.

Enable IOPF unconditionally when enabling SVA for now. In the future, if
a device driver implementing a uacce interface doesn't need IOPF
support, it will need to tell the uacce module, for example with a new
flag.

Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
---
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Zhangfei Gao <zhangfei.gao@linaro.org>
Cc: Zhou Wang <wangzhou1@hisilicon.com>
---
 drivers/misc/uacce/uacce.c | 32 +++++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
index d07af4edfcac..41ef1eb62a14 100644
--- a/drivers/misc/uacce/uacce.c
+++ b/drivers/misc/uacce/uacce.c
@@ -385,6 +385,24 @@ static void uacce_release(struct device *dev)
 	kfree(uacce);
 }
 
+static unsigned int uacce_enable_sva(struct device *parent, unsigned int flags)
+{
+	if (!(flags & UACCE_DEV_SVA))
+		return flags;
+
+	flags &= ~UACCE_DEV_SVA;
+
+	if (iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_IOPF))
+		return flags;
+
+	if (iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA)) {
+		iommu_dev_disable_feature(parent, IOMMU_DEV_FEAT_IOPF);
+		return flags;
+	}
+
+	return flags | UACCE_DEV_SVA;
+}
+
 /**
  * uacce_alloc() - alloc an accelerator
  * @parent: pointer of uacce parent device
@@ -404,11 +422,7 @@ struct uacce_device *uacce_alloc(struct device *parent,
 	if (!uacce)
 		return ERR_PTR(-ENOMEM);
 
-	if (flags & UACCE_DEV_SVA) {
-		ret = iommu_dev_enable_feature(parent, IOMMU_DEV_FEAT_SVA);
-		if (ret)
-			flags &= ~UACCE_DEV_SVA;
-	}
+	flags = uacce_enable_sva(parent, flags);
 
 	uacce->parent = parent;
 	uacce->flags = flags;
@@ -432,8 +446,10 @@ struct uacce_device *uacce_alloc(struct device *parent,
 	return uacce;
 
 err_with_uacce:
-	if (flags & UACCE_DEV_SVA)
+	if (flags & UACCE_DEV_SVA) {
 		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_SVA);
+		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_IOPF);
+	}
 	kfree(uacce);
 	return ERR_PTR(ret);
 }
@@ -487,8 +503,10 @@ void uacce_remove(struct uacce_device *uacce)
 	mutex_unlock(&uacce->queues_lock);
 
 	/* disable sva now since no opened queues */
-	if (uacce->flags & UACCE_DEV_SVA)
+	if (uacce->flags & UACCE_DEV_SVA) {
 		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_SVA);
+		iommu_dev_disable_feature(uacce->parent, IOMMU_DEV_FEAT_IOPF);
+	}
 
 	if (uacce->cdev)
 		cdev_device_del(uacce->cdev, &uacce->dev);
-- 
2.29.2

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
