Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id D700527B72A
	for <lists.iommu@lfdr.de>; Mon, 28 Sep 2020 23:37:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 3B6FD85A92;
	Mon, 28 Sep 2020 21:37:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Es7zVSRO-c6S; Mon, 28 Sep 2020 21:37:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 54AA285ABE;
	Mon, 28 Sep 2020 21:37:00 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 41A06C0051;
	Mon, 28 Sep 2020 21:37:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2C070C0051
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1B20C8707B
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:36:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ex4kkuOZhRTv for <iommu@lists.linux-foundation.org>;
 Mon, 28 Sep 2020 21:36:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com
 [209.85.210.194])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 9DB7686CE0
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 21:36:57 +0000 (UTC)
Received: by mail-pf1-f194.google.com with SMTP id b124so2369995pfg.13
 for <iommu@lists.linux-foundation.org>; Mon, 28 Sep 2020 14:36:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=d1FfSiT0/rNuXhBVREG/yc6QeqXaZmsaJ55ClmMPrSA=;
 b=r0TFUtTL36ac2nmkkmqUvShag9p4Nr90dTd1zKFHpK0u06RB7xzvc10y/8rI43dRe9
 aL92VrM5u5jZPGZTrUTvzcCbWgiyP4IcC96N052t63wUVxyrF/jZ7TDILYSXdKRmmr/L
 GEX41iDNcl+PjkT7LI/2yZK1HVJ83WPCUcOeUtUuwd0GNCVro3zwgXgxmi1qwlKttoCR
 xNC42K+M5nDlIwHkyZA8/Hmp646Gumsdrwn+oVp4UOzedPc3hrLGGIUYuRmBnUsuzTZq
 hNy82OUKOWV1dcv//ylXy4FULe24ZdrYw95f9PDvCipj1BN+xc/Ip+xKPrBsIAtdMh0j
 I18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=d1FfSiT0/rNuXhBVREG/yc6QeqXaZmsaJ55ClmMPrSA=;
 b=Eei8HH9PDwtT6G0ebvoxClA1m1W1BNE/2bkQZm3KqN8GN/hy6ky9sHOxe8qm7OJbqG
 HtSJt+aY0Vxh+Kz0tVxu0ejH4AJMN4B9K+So3NApXrckXAN3R0ZeaaNe5RPZ7sml2o6P
 qotsvj+cZcxgSPmHAFhpKZd4hVXIBzi2j8S6vAaV2CqRkbLis9xme+tPQNP9VeXhA9xT
 MTs5BRTYlqZ1AI5JRViDnqHizXArUchv+zB3Iztv5WixtiIBkRE3hlzSO2WhteEQM6Hl
 5EOfl3/8XdX0ZpG6sMa7zUXd8vqmGcyyajImo69Mg0ubQ1V25JRRjsCVf8JVAAoPT3O5
 JVyg==
X-Gm-Message-State: AOAM533fauJAYkzF21EX3/VJkFRtiIEYmD8Ib6THLvESbRWGvzGU8jYF
 hocrDfapp7783ePye6cG2okJ6PSNypA=
X-Google-Smtp-Source: ABdhPJwj+5XtiJEtx58cHwj9dKNKedPMVVg0ZTMpDicVIRoVL1W2IJBC4s9o5U0euw0uP7XZGvRA0g==
X-Received: by 2002:a65:410c:: with SMTP id w12mr756685pgp.411.1601329017069; 
 Mon, 28 Sep 2020 14:36:57 -0700 (PDT)
Received: from jacob-builder.jf.intel.com (jfdmzpr04-ext.jf.intel.com.
 [134.134.137.73])
 by smtp.gmail.com with ESMTPSA id l11sm2220864pjf.17.2020.09.28.14.36.56
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 28 Sep 2020 14:36:56 -0700 (PDT)
From: Jacob Pan <jacob.pan.linux@gmail.com>
X-Google-Original-From: Jacob Pan <jacob.jun.pan@linux.intel.com>
To: iommu@lists.linux-foundation.org, LKML <linux-kernel@vger.kernel.org>,
 Joerg Roedel <joro@8bytes.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Lu Baolu" <baolu.lu@linux.intel.com>,
 David Woodhouse <dwmw2@infradead.org>, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v3 12/14] iommu/vt-d: Remove mm reference for guest SVA
Date: Mon, 28 Sep 2020 14:38:39 -0700
Message-Id: <1601329121-36979-13-git-send-email-jacob.jun.pan@linux.intel.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1601329121-36979-1-git-send-email-jacob.jun.pan@linux.intel.com>
References: <1601329121-36979-1-git-send-email-jacob.jun.pan@linux.intel.com>
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Dave Jiang <dave.jiang@intel.com>,
 Raj Ashok <ashok.raj@intel.com>, linux-api@vger.kernel.org,
 Randy Dunlap <rdunlap@infradead.org>, Yi Sun <yi.y.sun@intel.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.com>, Wu Hao <hao.wu@intel.com>
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

Now that IOASID core keeps track of the IOASID to mm_struct ownership in
the forms of ioasid_set with IOASID_SET_TYPE_MM token type, there is no
need to keep the same mapping in VT-d driver specific data. Native SVM
usage is not affected by the change.

Signed-off-by: Jacob Pan <jacob.jun.pan@linux.intel.com>
---
 drivers/iommu/intel/svm.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/iommu/intel/svm.c b/drivers/iommu/intel/svm.c
index 2e764e283469..39a09a93300e 100644
--- a/drivers/iommu/intel/svm.c
+++ b/drivers/iommu/intel/svm.c
@@ -338,12 +338,6 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 			ret = -ENOMEM;
 			goto out;
 		}
-		/* REVISIT: upper layer/VFIO can track host process that bind
-		 * the PASID. ioasid_set = mm might be sufficient for vfio to
-		 * check pasid VMM ownership. We can drop the following line
-		 * once VFIO and IOASID set check is in place.
-		 */
-		svm->mm = get_task_mm(current);
 		svm->pasid = data->hpasid;
 		if (data->flags & IOMMU_SVA_GPASID_VAL) {
 			svm->gpasid = data->gpasid;
@@ -351,7 +345,6 @@ int intel_svm_bind_gpasid(struct iommu_domain *domain, struct device *dev,
 		}
 		ioasid_attach_data(data->hpasid, svm);
 		INIT_LIST_HEAD_RCU(&svm->devs);
-		mmput(svm->mm);
 	}
 	sdev = kzalloc(sizeof(*sdev), GFP_KERNEL);
 	if (!sdev) {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
