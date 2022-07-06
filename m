Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 467715696C7
	for <lists.iommu@lfdr.de>; Thu,  7 Jul 2022 02:17:38 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61F9040C4C;
	Thu,  7 Jul 2022 00:17:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 61F9040C4C
Authentication-Results: smtp2.osuosl.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20210112 header.b=qiUwOsPC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIgP4NjeSJp7; Thu,  7 Jul 2022 00:17:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 1C84C40B5C;
	Thu,  7 Jul 2022 00:17:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1C84C40B5C
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id B5D3DC0077;
	Thu,  7 Jul 2022 00:17:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 4818BC002D
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 29BD283E64
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 29BD283E64
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=qiUwOsPC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IUeEfJvlT5V7 for <iommu@lists.linux-foundation.org>;
 Wed,  6 Jul 2022 19:51:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CECD883E35
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CECD883E35
 for <iommu@lists.linux-foundation.org>; Wed,  6 Jul 2022 19:51:22 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id y8so14828424eda.3
 for <iommu@lists.linux-foundation.org>; Wed, 06 Jul 2022 12:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T/Uniy8LBcxVwi6NUSTS6A3GCA+91o6vI7rMz3Wtdlk=;
 b=qiUwOsPCNmCmsMJzHRsMCaqHx/A29XFx+rEtXjpqLg05bj73vgI77R8nubnEYJ+G4/
 p3lABAQJJTZVJuLPfbcf0/Fbe8CGrKSC202O5G+CGOx6Ltsc0jTW4ZBsabqe1nhSvicM
 hGITTa5Eqvo/4HZ2OLE8sSJ1r0Z5cDjhIo9poy31FT4uT+YeMzQBou6F7hhhgFNb0vJB
 gmaOFBXvzYhqf5RoSr/SXJ6AaRWj15Xso85XVvRCE/8azbqlsFTr9Nc43wazo2H6U4Up
 0lZgKwKvQDF3FBwGEZ7WpsN1gQthA4oR2esJEp+LJQ6WbXe6sXLmZpHrG7GEeW8fjJtk
 O26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T/Uniy8LBcxVwi6NUSTS6A3GCA+91o6vI7rMz3Wtdlk=;
 b=PpZYAqEZJ2LRsgCnDcZShJbd5SmLq9cgIFVjKYeymftXtrfhp8dMFRbx2gnoXdW76U
 QPeZF/kV9ikIvTKvSv/YnxC7jwFTHAwqJJafqFXhgwxml5Ji1s2JnuZ21xKdE1nF2670
 7oibXPvQ4z9jEe9RnJla76OfhQuufuvYQIqLOus25ioh9f8QOSVbR/6fL5UA5H73UMAh
 S6CXbLTOAn0kzXlxVCF4IEnoursdxYRUJ/yK8i2wxJlfIicJq3n90Rfahb8Wk5E9VCx0
 0eATyIQWiZfyFzwLcC4yJKU3gA+eJ4CssJOTWWBvAahGTUqPFV4z+Cj393+dmqWHpew8
 DzCA==
X-Gm-Message-State: AJIora/q3jOgyQ06aPGsFd38mCNQe2XaZ0fslfeE2Vs15gRKaEp8DpDB
 PnrHidIao2/wtTtMd78VLx8=
X-Google-Smtp-Source: AGRyM1tL5OpzeEvjnryKM1zyCU6rO5tLkN/wI78MRbQT2J+6bNMgnN1GnuVvmU0S8Pptetfi9UCRhA==
X-Received: by 2002:a05:6402:42cb:b0:43a:5df2:bb5d with SMTP id
 i11-20020a05640242cb00b0043a5df2bb5dmr23876112edc.36.1657137080986; 
 Wed, 06 Jul 2022 12:51:20 -0700 (PDT)
Received: from anparri.mshome.net (host-79-49-199-193.retail.telecomitalia.it.
 [79.49.199.193]) by smtp.gmail.com with ESMTPSA id
 kz11-20020a17090777cb00b0072af18329c4sm1968127ejc.225.2022.07.06.12.51.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 12:51:20 -0700 (PDT)
From: "Andrea Parri (Microsoft)" <parri.andrea@gmail.com>
To: Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, KY Srinivasan <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>,
 Stephen Hemminger <sthemmin@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Michael Kelley <mikelley@microsoft.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 Peter Anvin <hpa@zytor.com>
Subject: [RFC PATCH 0/2] dma_direct_{alloc,free}() for Hyper-V IVMs
Date: Wed,  6 Jul 2022 21:50:25 +0200
Message-Id: <20220706195027.76026-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 07 Jul 2022 00:17:33 +0000
Cc: "Andrea Parri \(Microsoft\)" <parri.andrea@gmail.com>,
 linux-hyperv@vger.kernel.org, iommu@lists.linux.dev, x86@kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org
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

Through swiotlb_unencrypted_base.

P.S.  I'm on vacation for the next couple of weeks starting next Monday;
Dexuan/Michael should be able to address review feedback in that period.

Andrea Parri (Microsoft) (2):
  swiotlb,dma-direct: Move swiotlb_unencrypted_base to direct.c
  dma-direct: Fix dma_direct_{alloc,free}() for Hyperv-V IVMs

 arch/x86/kernel/cpu/mshyperv.c |  6 +++---
 include/linux/dma-direct.h     |  2 ++
 include/linux/swiotlb.h        |  2 --
 kernel/dma/direct.c            | 38 +++++++++++++++++++++++++++++++++-
 kernel/dma/swiotlb.c           | 12 +++++------
 5 files changed, 47 insertions(+), 13 deletions(-)

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
