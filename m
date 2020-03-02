Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C6063175130
	for <lists.iommu@lfdr.de>; Mon,  2 Mar 2020 01:05:08 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 7C0E88508A;
	Mon,  2 Mar 2020 00:05:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id easj6Hbekvdu; Mon,  2 Mar 2020 00:05:07 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2E0FD8508E;
	Mon,  2 Mar 2020 00:05:07 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 14928C013E;
	Mon,  2 Mar 2020 00:05:07 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 09AEBC013E
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 00:05:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id F11CC20020
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 00:05:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e65PscjaJd1E for <iommu@lists.linux-foundation.org>;
 Mon,  2 Mar 2020 00:05:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
 [209.85.210.196])
 by silver.osuosl.org (Postfix) with ESMTPS id 7A4182001F
 for <iommu@lists.linux-foundation.org>; Mon,  2 Mar 2020 00:05:05 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id j9so4650750pfa.8
 for <iommu@lists.linux-foundation.org>; Sun, 01 Mar 2020 16:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:from:to:cc:subject:in-reply-to:message-id:references
 :user-agent:mime-version;
 bh=duQmTYNCdTI2ExbCdQAh/8UU3ifimZfip77jBZoZbNU=;
 b=jlj7siV1TsnOyaF1QtiqKfaebECjBDKmNmm8gEL4qjrYBk63y7xp8jMWhXyNh7Q7X2
 YSv0ijY85X5tt61zI80JKR8FceG+hyKaKTY13aWQdAlQd3TTRF2ASyO3Jzotsl2DI8oy
 dVs0kIJMxRuDvZDgHTR/gjlh32aMfFeoCmer8w1ttzI17Yse52omc1BYOuus4AqYc6I3
 4lt+mnUY60HfrHA7fHcIG72Wghpe4Mp2Z8GPGR3+bVH1wbtPlBBJsAeIizt1rVi8wPBw
 bFDGCbpr9j2QF8iBsvBDvcVib8UNAbqEc2YAoWyY+W/EpJX89VRUfkSA2+tjsSViVIVK
 ZLYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:message-id
 :references:user-agent:mime-version;
 bh=duQmTYNCdTI2ExbCdQAh/8UU3ifimZfip77jBZoZbNU=;
 b=USTjvEuP8kdBDlv3SE5IIeuIaf5PiX7JdvCV4yGr+2Ig8bgzuruk0U5gdmFkm+9WPX
 zjINk+5hP0LLmXoekSRE/5FjOobj91ekB62miIAj6A7Yj/OWSkxElyK9guNGGHFyvkZt
 R8dSoO3tOxN20u1b9YGYyK88/qA2tAuKTy5K42bQx/wX3dAH9EA2CCKJnOu5mKXX4+1b
 hbOo21MCk8jhbnAo3Yv56A8jwKJXhNxkCLD3Bg3POV4adeeD5itiy46AnjemKOsTJfHC
 m+yyefVlFmf8YVGShbwhTnVJKr4RT67oUy2HEr9UmXvwIkIuuduZFw6Ry5D0tLFbRsu/
 KAUg==
X-Gm-Message-State: APjAAAVH4+ZdWPapqMJ3WOfTgepE/hTXOPcf51ZgJn/qbKPLV8ybHvim
 gDySTshf+babKWyi3Ty0OJjF1g==
X-Google-Smtp-Source: APXvYqzfZsJg2bBBYco0M4jf0fO2AMzcS3eeNSjht5sN/BOWqYBPfvzUOG6Db9g5GtM1UnO9fzXdPg==
X-Received: by 2002:a63:7e52:: with SMTP id o18mr16843186pgn.46.1583107504654; 
 Sun, 01 Mar 2020 16:05:04 -0800 (PST)
Received: from [2620:15c:17:3:3a5:23a7:5e32:4598]
 ([2620:15c:17:3:3a5:23a7:5e32:4598])
 by smtp.gmail.com with ESMTPSA id y16sm18340134pfn.177.2020.03.01.16.05.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 Mar 2020 16:05:03 -0800 (PST)
Date: Sun, 1 Mar 2020 16:05:03 -0800 (PST)
X-X-Sender: rientjes@chino.kir.corp.google.com
To: Christoph Hellwig <hch@lst.de>, Tom Lendacky <thomas.lendacky@amd.com>
Subject: [rfc 0/6] unencrypted atomic DMA pools with dynamic expansion
In-Reply-To: <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
Message-ID: <alpine.DEB.2.21.2003011535510.213582@chino.kir.corp.google.com>
References: <alpine.DEB.2.21.1912311738130.68206@chino.kir.corp.google.com>
 <b22416ec-cc28-3fd2-3a10-89840be173fa@amd.com>
 <alpine.DEB.2.21.2002280118461.165532@chino.kir.corp.google.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Cc: "Singh, Brijesh" <brijesh.singh@amd.com>, "Grimm, Jon" <jon.grimm@amd.com>,
 baekhw@google.com,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
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
From: David Rientjes via iommu <iommu@lists.linux-foundation.org>
Reply-To: David Rientjes <rientjes@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

set_memory_decrypted() may block so it is not possible to do non-blocking
allocations through the DMA API for devices that required unencrypted
memory.

The solution is to expand the atomic DMA pools for the various possible
gfp requirements as a means to prevent an unnecessary depletion of lowmem.

These atomic DMA pools are kept unencrypted so they can immediately be
used for non-blocking allocations.  Since the need for this type of memory
depends on the kernel config and devices being used, these pools are also
dynamically expandable.

Some of these patches could be squashed into each other, but they were
separated out to ease code review.

This patchset is based on 5.6-rc4.
---
 arch/x86/Kconfig            |   1 +
 drivers/iommu/dma-iommu.c   |   5 +-
 include/linux/dma-direct.h  |   2 +
 include/linux/dma-mapping.h |   6 +-
 kernel/dma/direct.c         |  17 ++--
 kernel/dma/remap.c          | 173 +++++++++++++++++++++++++-----------
 6 files changed, 140 insertions(+), 64 deletions(-)
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
