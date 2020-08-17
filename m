Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 61EE1246DEC
	for <lists.iommu@lfdr.de>; Mon, 17 Aug 2020 19:18:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id CF25B84AC5;
	Mon, 17 Aug 2020 17:18:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KBQPqidReTlL; Mon, 17 Aug 2020 17:18:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 712438484B;
	Mon, 17 Aug 2020 17:18:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5C94BC07FF;
	Mon, 17 Aug 2020 17:18:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 198BAC07FF
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 17:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 0795A848AB
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 17:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2E72QlT1r5D1 for <iommu@lists.linux-foundation.org>;
 Mon, 17 Aug 2020 17:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 1D1CE8484B
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 17:18:31 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id a26so18666095ejc.2
 for <iommu@lists.linux-foundation.org>; Mon, 17 Aug 2020 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Boijbz1Cc9le/pi4BN56ApCuXytjHtrC9LCARztTCdk=;
 b=T75eOb0SOCdRUJttM7KnbbfvCMT+T8xjCY+zvsK8C6+0J2axZ8alnR7UGF495AkBaR
 uYwJW6JANn244f9LRVO0u3ioeHAFS82bi2K7xSkQYj5zU43VMgkt/mJ3hcCGOeLKz00s
 CJ0UDnPOdk6SyRsEHW6U5X0knHdLlGX6Sc34QqJBBN6unfcEox0jtdp1HmYEYAGXJSYz
 ZSlJ5GX8DnsV43FWoXwfELxbP/5tXn0JDV8KCSEcHr0MwL28kWu+LvBgoxF75zFQHi2s
 ta7LFqW6vW509B2QhGxoPvHuSckBrD31h9UWHXiC9N0rmO34sVkHKXmMAP2dEN7dZf4G
 YDHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Boijbz1Cc9le/pi4BN56ApCuXytjHtrC9LCARztTCdk=;
 b=lVTySA1+lPDucPZB0uBAY43IAjodkEZI1oCnN6K1d5ayI3dsLVPUECzAqK+BGYNnCq
 GrULE86nimBYyJXvEr2dsrLCmsrE30VYi7b0mhwQKJcta56WrPz1AbTPFythqKO4941z
 gp+XJzVAzdyG0+0rpG8hGEp5Ot5hpph9X0hJv4fOs8lw5YCIBp60r4MQkTla23n1qmgj
 iW9QasU8pjVLX6N4Gsuso1HycJ48+TzbQdQVdqauS4pMzQ7AhI99RaK3PvF4zuaLVThm
 Ce4EZo1PcRRvuRTXE7wokbMsJxWmd+O4EPCYmj/+ELfJg3K11iMY9SFAMvLhpUOII23C
 QtlA==
X-Gm-Message-State: AOAM5327yohyu3N2feT3aoxpNbUqtB2JcvVJWDVWyd/ha74kf02OsPYE
 t5uQtcJ8r5Ph2oH7fpCXmfuE/cN1PItGiNSG
X-Google-Smtp-Source: ABdhPJz06raczHFX6iTuHssmiZpDPuN9pbFl/atXm0zVV73yTmAdusFHM5vfXr85ksNp3KWW1xIAxA==
X-Received: by 2002:a17:906:6cd:: with SMTP id
 v13mr15799520ejb.307.1597684709156; 
 Mon, 17 Aug 2020 10:18:29 -0700 (PDT)
Received: from localhost.localdomain
 ([2001:1715:4e26:a7e0:116c:c27a:3e7f:5eaf])
 by smtp.gmail.com with ESMTPSA id lc18sm14672502ejb.29.2020.08.17.10.18.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 10:18:28 -0700 (PDT)
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: iommu@lists.linux-foundation.org, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org
Subject: [PATCH RESEND v9 01/13] mm: Define pasid in mm
Date: Mon, 17 Aug 2020 19:15:47 +0200
Message-Id: <20200817171558.325917-2-jean-philippe@linaro.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200817171558.325917-1-jean-philippe@linaro.org>
References: <20200817171558.325917-1-jean-philippe@linaro.org>
MIME-Version: 1.0
Cc: fenghua.yu@intel.com, catalin.marinas@arm.com, robin.murphy@arm.com,
 Christoph Hellwig <hch@infradead.org>, zhengxiang9@huawei.com,
 Tony Luck <tony.luck@intel.com>, zhangfei.gao@linaro.org, will@kernel.org
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
index 496c3ff97cce..1ff0615ef19f 100644
--- a/include/linux/mm_types.h
+++ b/include/linux/mm_types.h
@@ -542,6 +542,10 @@ struct mm_struct {
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
2.28.0

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
