Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 7218949CF4A
	for <lists.iommu@lfdr.de>; Wed, 26 Jan 2022 17:11:15 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 188B84046D;
	Wed, 26 Jan 2022 16:11:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TsgvKjGg7nwh; Wed, 26 Jan 2022 16:11:13 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1FF894019A;
	Wed, 26 Jan 2022 16:11:13 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C3CAEC002D;
	Wed, 26 Jan 2022 16:11:12 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2DEC7C002D
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 16:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0C66D83118
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 16:11:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id If5Wa8a4auOW for <iommu@lists.linux-foundation.org>;
 Wed, 26 Jan 2022 16:11:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1ECEC83027
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 16:11:09 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id h23so21454239pgk.11
 for <iommu@lists.linux-foundation.org>; Wed, 26 Jan 2022 08:11:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJlQgMOdzOpMdf2t1XhINYD9th+quD5vXgXLujbMrXw=;
 b=R4Bfn186yJ2h2iAnn75qDBMXPx31A+KGAptApzHgK9YFmMr7rPTZIejMEO4GV1Izzq
 u27ZAELgpedJodaq/uQ6lnGeqUmgeyu3FOuKWIJsIvUhxpCkgELzb72CB8vjtGceqyth
 1SeTvg1CV3xjZ9OUDVsrIHcbmJN201BFEBkOlEWtPW90dwx7MbS7dg99u1YOjxBafKQB
 qpzeKD97jLFdQgo/ot3uC7Hjuv/3tNQ9/LksoxXiZ+CokPWG1g6Sn/PcNHx/mOwQ03DA
 ulEFltjT2HhW/ipjaynwoI/0orSVYpLSBuaFoJRZ0k8Ab999NsDf1rVI4Si/sQMIbMf8
 1nkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FJlQgMOdzOpMdf2t1XhINYD9th+quD5vXgXLujbMrXw=;
 b=OEPZlTvncVKtQ0xW6No0GAVBgQDTE6K5+b1Pqy96DlsCN6PhF/8ItRyYLLHSnvZN+c
 io0KkdH/zury607f9n7ayjlShmxSM1MrrsVVjuZKb6Uo7Xz8WpCaOLHbgSnNAAGfSKEQ
 P+etdNe1iH8C4iy/16lzw1/HuNK0FTRXs2l6LcGYPj+IFI1usVDDxkBXVVfKa7MujJ0r
 G0N0RGHBQVf0iUaPXVq0XJ4dBxSD66LOVDlbD7q9jfz979UGOQ1aTK8nprvjtBC3qgeG
 IWZvLdH85i8sUi4PfVpEs+r71zEU5YdXDYQAYilseEkrXVvQ4Bxh8Wl99ZieuySHUTLH
 V6Vg==
X-Gm-Message-State: AOAM530tTc74WDHN2mjupGiEQPkLhCxN4S83WSha8n4qV5FuzAWhk5Ci
 hHRgCawQvaSQuHXt0LstbTI=
X-Google-Smtp-Source: ABdhPJzTD24IB15DhwEOQaTAU9UVRYQRs92SBHaR2aTpmWbIBqvbdG21oKDt0iSc/VgjlbVpBNKFrA==
X-Received: by 2002:a05:6a00:a20:b0:4bb:95f6:93b3 with SMTP id
 p32-20020a056a000a2000b004bb95f693b3mr23480200pfh.77.1643213468515; 
 Wed, 26 Jan 2022 08:11:08 -0800 (PST)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:35:cf50:7507:71bb:9b04])
 by smtp.gmail.com with ESMTPSA id b9sm2555534pfm.154.2022.01.26.08.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 08:11:08 -0800 (PST)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 x86@kernel.org, hpa@zytor.com, hch@infradead.org, m.szyprowski@samsung.com,
 robin.murphy@arm.com, michael.h.kelley@microsoft.com
Subject: [PATCH 0/2] x86/hyperv/Swiotlb: Add swiotlb_alloc_from_low_pages
 switch
Date: Wed, 26 Jan 2022 11:10:51 -0500
Message-Id: <20220126161053.297386-1-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: parri.andrea@gmail.com, thomas.lendacky@amd.com,
 linux-hyperv@vger.kernel.org, Tianyu Lan <Tianyu.Lan@microsoft.com>,
 konrad.wilk@oracle.com, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, brijesh.singh@amd.com, vkuznets@redhat.com,
 hch@lst.de
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

From: Tianyu Lan <Tianyu.Lan@microsoft.com>

Hyper-V Isolation VM may fail to allocate swiotlb bounce buffer due
to there is no enough contiguous memory from 0 to 4G in some cases.
Current swiotlb code allocate bounce buffer in the low end memory.
This patchset adds a switch "swiotlb_alloc_from_low_pages" and it's
set to true by default. Platform may clear it if necessary. Devices
in Hyper-V Isolation VM may use memory above 4G as DMA memory and set
the switch to false in order to avoid no enough contiguous memory in
low end address space.

Tianyu Lan (2):
  Swiotlb: Add swiotlb_alloc_from_low_pages switch
  x86/hyperv: Set swiotlb_alloc_from_low_pages to false

 arch/x86/kernel/cpu/mshyperv.c |  1 +
 include/linux/swiotlb.h        |  1 +
 kernel/dma/swiotlb.c           | 13 +++++++++++--
 3 files changed, 13 insertions(+), 2 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
