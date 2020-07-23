Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4932822B21C
	for <lists.iommu@lfdr.de>; Thu, 23 Jul 2020 17:05:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id EC1892076E;
	Thu, 23 Jul 2020 15:05:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b9VaEWmiIEfi; Thu, 23 Jul 2020 15:05:52 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 69CF120396;
	Thu, 23 Jul 2020 15:05:52 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5B1E7C004C;
	Thu, 23 Jul 2020 15:05:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 39A42C004C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 279ED865A5
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OL8gOVADyp5h for <iommu@lists.linux-foundation.org>;
 Thu, 23 Jul 2020 15:05:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
 [209.85.208.68])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 4133E8655C
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 15:05:49 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id q4so1530628edv.13
 for <iommu@lists.linux-foundation.org>; Thu, 23 Jul 2020 08:05:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+GSsqAmRYo5YOIIF67wsMh/QH5K3e+p6piN1dBGQeZo=;
 b=A3x9ZNUiNkchSCqN/Y2+rVNEG3cooy0NdE4kKd7eF/yJvy+eswwswqhDneZrH+0MDs
 RmA4Nif/EZz90XMTqfeItoWYJlHqiEICJJlaLRij1mMMCTpUfr8fwGBx4nFVx3Re+RPU
 Ed0DGk0hVY2QLyVaVA0DLQAd5VrmmzU22wZmOI6SKxiPhLuKV5F/uYLOv6zzj0qwcdYh
 S8AkkV9WpcC+Ub1/+qQ6N1mNOGESjUBC9EWMGEQ+RiM2yNBzSjOvlcd0YL1WTXmuRPQ8
 Ykf5ZbhAWgb40CDYdk0/Nlsp7h1U+4XL64SViJMsNsXbz+VSM19XhhPngaq0PvEVtL2q
 ULlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+GSsqAmRYo5YOIIF67wsMh/QH5K3e+p6piN1dBGQeZo=;
 b=rw1jZrqbM44tg0HUvtN7GJBiOh83OAIm+mkPEuWlkiPvHd/6ibvXwI+JE4IWpAbQda
 +phwKMq8eaFwu2CPWCQvgxNOxSm4u1zPddIk4TdF4C3qKZXa1y9xnDMRL55OlQjszO3Y
 YyZ2zJcwn5Socud5E33C1Q8JF4mt3HntF4S9A8yiwZKVrrENtPAChFZQOKb5yCUFScxN
 sQpfT/tpd8HNkmmWlHeqoshvfErueVOmXPcw7Gp9nHW4n6eFw4vHGj6zqHAoBsRjxsvP
 QT04THi8YozoPYlTOuUBWbPl++zd830ylpMneZcDLTOlLZrxVyuWrX+JlzY5u3tGLKta
 Tv6Q==
X-Gm-Message-State: AOAM533Vl/oI3tMG2IaMmooi+yXyUCBZdnpRxwXt1Yeb8hda3UVgjKBx
 20P2fVPNMnQUSUA6uEEyuHNAtw8a6us=
X-Google-Smtp-Source: ABdhPJyXttub8o+VyJgO+UKD+ccLd3hT5h2Uwz/upuFRlXsrp3TZZ1ZjH8cTHC96Joh6797HCzPm2A==
X-Received: by 2002:a50:ee87:: with SMTP id f7mr4628941edr.355.1595516747245; 
 Thu, 23 Jul 2020 08:05:47 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id k15sm2145952eji.49.2020.07.23.08.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jul 2020 08:05:46 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH v9 01/13] mm: Define pasid in mm
Date: Thu, 23 Jul 2020 16:57:13 +0200
Message-Id: <20200723145724.3014766-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200723145724.3014766-1-jean-philippe@linaro.org>
References: <20200723145724.3014766-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, catalin.marinas@arm.com, robin.murphy@arm.com,
 hch@infradead.org, zhengxiang9@huawei.com, Tony Luck <tony.luck@intel.com>,
 zhangfei.gao@linaro.org, will@kernel.org
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

From: Fenghua Yu <fenghua.yu@intel.com>

PASID is shared by all threads in a process. So the logical place to keep
track of it is in the "mm". Both ARM and X86 need to use the PASID in the
"mm".

Suggested-by: Christoph Hellwig <hch@infradead.org>
Signed-off-by: Fenghua Yu <fenghua.yu@intel.com>
Reviewed-by: Tony Luck <tony.luck@intel.com>
---
https://lore.kernel.org/linux-iommu/1594684087-61184-8-git-send-email-fenghua.yu@intel.com/
---
---
 include/linux/mm_types.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/mm_types.h b/include/linux/mm_types.h
index 64ede5f150dc..d61285cfe027 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -538,6 +538,10 @@ struct mm_struct {
 		atomic_long_t hugetlb_usage;
 #endif
 		struct work_struct async_put_work;
+
+#ifdef CONFIG_IOMMU_SUPPORT
+		u32 pasid;
+#endif
 	} __randomize_layout;
 
 	/*
-- 
2.27.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
