Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id DED011CEBC8
	for <lists.iommu@lfdr.de>; Tue, 12 May 2020 06:09:28 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 675332C290;
	Tue, 12 May 2020 04:09:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fVRlWNZKmT5w; Tue, 12 May 2020 04:09:26 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 9C691255B4;
	Tue, 12 May 2020 04:09:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8323BC016F;
	Tue, 12 May 2020 04:09:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 688B2C016F
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 64F1A88951
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Vz-TjBHBuzX for <iommu@lists.linux-foundation.org>;
 Tue, 12 May 2020 04:09:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pj1-f67.google.com (mail-pj1-f67.google.com
 [209.85.216.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 25B1988911
 for <iommu@lists.linux-foundation.org>; Tue, 12 May 2020 04:09:24 +0000 (UTC)
Received: by mail-pj1-f67.google.com with SMTP id e6so8744032pjt.4
 for <iommu@lists.linux-foundation.org>; Mon, 11 May 2020 21:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=7aGIDKJhsEoY1eFnx3GCg/ODucM/74uibRkoUrBNgnI=;
 b=MbXe+HW+y1nKNTeJX7Rkc7vQR92xitRyMqVJP0a6SsxnDbH6iUYomnq74hWzkTZ68f
 VsDEXcDNI+WiQL7KRKURgC+DnubpxvtlSqRn6orZ3t6ahJUtWU/jba1VmPfGbrAQFqe9
 d0BOXtDZ+KmfLxAs01EAm+ZevUv5lCcWOdbmkxj/n/F+TajL6AyfojV7uQRSExlmsqBt
 LzIIpV/HCvUMd5y8iKO9j+SJ+YZ0MESDLDGKnwdAtg4g2nGjok30yTiubZY4Wdh/s4tp
 eZT6ISiSZ2ssxGHdJ8crKSCVmJ+01cXY+GFP12rW456eaMSvowo+kn4HrkR1btVPh/JZ
 jPwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=7aGIDKJhsEoY1eFnx3GCg/ODucM/74uibRkoUrBNgnI=;
 b=hmL7VavNHOaQSiBdkczdIkLWQGG57+6JbMyvSDRfeWVXZCQvjtqEldB3IRviXPt2x2
 N7IC8Kq2CuCVLUTi/wmgrCHv7LJzkKLY6szt+f8EHKDsQgL94/OfgjnEi4OreXCUSCMs
 OLeoTbC0474OYoXwaAHOQytbA459e/pivtGHQ/bFHvZAz+dTx7S350MNWeUIhbRYFArs
 Tt2bKRWgKhiKb/TbMFj711mrpxoPUGyN2dpeVgD2Jsm+oWcyZbZayIUdZlnvLybRraEH
 aXzM7nJGJ42qNAb5J+5iiK0NHcLoMveO+8umJxx851nmneUZm1FmcA0Ya2I6V3NPTeyn
 nVFQ==
X-Gm-Message-State: AGi0PuZT7FRzeTtGTX4/xwbzkX7KG+aJY+nIJnUUyqaIoFquZbgOCX9k
 3MOcZaoJlXHq0Fx1G7zv25uJpA==
X-Google-Smtp-Source: APiQypLaB23RJirP/v+StJWLJjQaMOF0325fVzznuPTbvKpEkcQWNB3eHs32G8ciUzq8DPIby5tNug==
X-Received: by 2002:a17:902:c281:: with SMTP id
 i1mr18100582pld.85.1589256563703; 
 Mon, 11 May 2020 21:09:23 -0700 (PDT)
Received: from localhost.localdomain ([240e:362:443:6f00:91af:f25c:441c:7ba4])
 by smtp.gmail.com with ESMTPSA id
 e4sm9471527pge.45.2020.05.11.21.09.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 11 May 2020 21:09:23 -0700 (PDT)
From: Zhangfei Gao <zhangfei.gao@linaro.org>
To: Joerg Roedel <joro@8bytes.org>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <lenb@kernel.org>,
 jean-philippe <jean-philippe@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Herbert Xu <herbert@gondor.apana.org.au>, kenneth-lee-2012@foxmail.com,
 Wangzhou <wangzhou1@hisilicon.com>
Subject: [PATCH 1/2] iommu/of: Let pci_fixup_final access iommu_fwnode
Date: Tue, 12 May 2020 12:08:30 +0800
Message-Id: <1589256511-12446-2-git-send-email-zhangfei.gao@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1589256511-12446-1-git-send-email-zhangfei.gao@linaro.org>
References: <1589256511-12446-1-git-send-email-zhangfei.gao@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
 iommu@lists.linux-foundation.org, linux-crypto@vger.kernel.org,
 Zhangfei Gao <zhangfei.gao@linaro.org>, linux-arm-kernel@lists.infradead.org
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

Calling pci_fixup_final after of_pci_iommu_init, which alloc
iommu_fwnode. Some platform devices appear as PCI but are
actually on the AMBA bus, and they need fixup in
drivers/pci/quirks.c handling iommu_fwnode.
So calling pci_fixup_final after iommu_fwnode is allocated.

Signed-off-by: Zhangfei Gao <zhangfei.gao@linaro.org>
---
 drivers/iommu/of_iommu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/of_iommu.c b/drivers/iommu/of_iommu.c
index 20738aac..c1b58c4 100644
--- a/drivers/iommu/of_iommu.c
+++ b/drivers/iommu/of_iommu.c
@@ -188,6 +188,7 @@ const struct iommu_ops *of_iommu_configure(struct device *dev,
 		pci_request_acs();
 		err = pci_for_each_dma_alias(to_pci_dev(dev),
 					     of_pci_iommu_init, &info);
+		pci_fixup_device(pci_fixup_final, to_pci_dev(dev));
 	} else if (dev_is_fsl_mc(dev)) {
 		err = of_fsl_mc_iommu_init(to_fsl_mc_device(dev), master_np);
 	} else {
-- 
2.7.4

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
