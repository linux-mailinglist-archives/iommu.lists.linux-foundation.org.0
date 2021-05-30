Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B089A395162
	for <lists.iommu@lfdr.de>; Sun, 30 May 2021 17:06:43 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEB1283A90;
	Sun, 30 May 2021 15:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L_o8pZMg7TuP; Sun, 30 May 2021 15:06:40 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp1.osuosl.org (Postfix) with ESMTP id ACC4983A8C;
	Sun, 30 May 2021 15:06:40 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 496C7C001C;
	Sun, 30 May 2021 15:06:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 719CFC0001
 for <iommu@lists.linux-foundation.org>; Sun, 30 May 2021 15:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BB2A4039F
 for <iommu@lists.linux-foundation.org>; Sun, 30 May 2021 15:06:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1uZnwjHAG_i for <iommu@lists.linux-foundation.org>;
 Sun, 30 May 2021 15:06:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com
 [IPv6:2607:f8b0:4864:20::1030])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EF1204035C
 for <iommu@lists.linux-foundation.org>; Sun, 30 May 2021 15:06:37 +0000 (UTC)
Received: by mail-pj1-x1030.google.com with SMTP id f8so5216405pjh.0
 for <iommu@lists.linux-foundation.org>; Sun, 30 May 2021 08:06:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FswRSQfjjaKx7u9LgIeEdiIRei+KQQ1o84JB2HXUqUs=;
 b=LVIdMBZyqnI96Q0Z0mysjEWnSTb1JW5nO8mVMTciG0aK/WD06/PLYNCl5nc+yK0XlS
 2WtJh9tLLiNzy5J3OgcTqz2Jd8R+Qo2XZ8PhM1LGbgk34btlpzEZSypPA3XtbSEfna7F
 0Xy/ByKjJYToboKNSYv39OSVL+1wl/6lNTlTcOxXyL9Czp3My1t9DZhs63AP25Sxxf87
 UAeJF9Q9PWAi/L9NXDXqX7YL7RDddpROE5Dwkr0XfidvpyFaGBUOGxVoC/o97y6s3Bgv
 uNtBz9O1DqUp24qMiBjYRplPEPbpwBaGprGuV8wqmdUN8j9x5KqKXakb0r59LpirJ6/C
 y0Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FswRSQfjjaKx7u9LgIeEdiIRei+KQQ1o84JB2HXUqUs=;
 b=N6TQTefDMTeqsGh7UwdDWQgqdsVnwD5cOCA9WifC5qSc514u4vDLo0BKbSug14R8rZ
 j/vNb+09Af4zRbuOjLx/tjxTFPCIsOm9BjK5AqxmE/VmnDM9sOd2NFb0c2sqQcGYzpjO
 z9TDUFE8rDQD5CUUdhUr4dgQVGAiLRm+h7ffYw1GUUMrxu39VFL5szOQjd/G4/ZxWLq7
 leyUNOHZjcIFIwplLHZSyb/DZOls+gaCDi8in0zrulYsmdeks80QjQiswOXWeuNtmEDG
 YRUfU1vHuNDA0duyYbw0Ti4wXx4mRmjXK+9rCKdJFBcnUbMQqdg21m00Ad9Dj1j2wLwY
 Gj/A==
X-Gm-Message-State: AOAM532pBggZG9XQtQ+o9DZr1I2rvJC2IxkSL+Fn0vbx3D5IIyyJt0Jp
 HqOVCyJpPwJ7/tRkUNb2lek=
X-Google-Smtp-Source: ABdhPJzWgX0reZL8RY1aCiYCdkLb1bxDmfsOiZs5Da5qdPNbLz2+PAq3adwYvehGmjtmOXLHMuRRYw==
X-Received: by 2002:a17:90a:fe84:: with SMTP id
 co4mr14479308pjb.0.1622387197133; 
 Sun, 30 May 2021 08:06:37 -0700 (PDT)
Received: from ubuntu-Virtual-Machine.corp.microsoft.com
 ([2001:4898:80e8:9:dc2d:80ab:c3f3:1524])
 by smtp.gmail.com with ESMTPSA id b15sm8679688pfi.100.2021.05.30.08.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 May 2021 08:06:36 -0700 (PDT)
From: Tianyu Lan <ltykernel@gmail.com>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org, decui@microsoft.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
 arnd@arndb.de, dave.hansen@linux.intel.com, luto@kernel.org,
 peterz@infradead.org, akpm@linux-foundation.org,
 kirill.shutemov@linux.intel.com, rppt@kernel.org, hannes@cmpxchg.org,
 cai@lca.pw, krish.sadhukhan@oracle.com, saravanand@fb.com,
 Tianyu.Lan@microsoft.com, konrad.wilk@oracle.com, hch@lst.de,
 m.szyprowski@samsung.com, robin.murphy@arm.com, boris.ostrovsky@oracle.com,
 jgross@suse.com, sstabellini@kernel.org, joro@8bytes.org, will@kernel.org,
 xen-devel@lists.xenproject.org, davem@davemloft.net, kuba@kernel.org,
 jejb@linux.ibm.com, martin.petersen@oracle.com
Subject: [RFC PATCH V3 00/11] x86/Hyper-V: Add Hyper-V Isolation VM support
Date: Sun, 30 May 2021 11:06:17 -0400
Message-Id: <20210530150628.2063957-1-ltykernel@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Cc: linux-arch@vger.kernel.org, thomas.lendacky@amd.com,
 linux-hyperv@vger.kernel.org, brijesh.singh@amd.com,
 linux-scsi@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux-foundation.org,
 vkuznets@redhat.com, sunilmut@microsoft.com
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

Hyper-V provides two kinds of Isolation VMs. VBS(Virtualization-based
security) and AMD SEV-SNP unenlightened Isolation VMs. This patchset
is to add support for these Isolation VM support in Linux.

The memory of these vms are encrypted and host can't access guest
memory directly. Hyper-V provides new host visibility hvcall and
the guest needs to call new hvcall to mark memory visible to host
before sharing memory with host. For security, all network/storage
stack memory should not be shared with host and so there is bounce
buffer requests.

Vmbus channel ring buffer already plays bounce buffer role because
all data from/to host needs to copy from/to between the ring buffer
and IO stack memory. So mark vmbus channel ring buffer visible.

There are two exceptions - packets sent by vmbus_sendpacket_
pagebuffer() and vmbus_sendpacket_mpb_desc(). These packets
contains IO stack memory address and host will access these memory.
So add allocation bounce buffer support in vmbus for these packets.

For SNP isolation VM, guest needs to access the shared memory via
extra address space which is specified by Hyper-V CPUID HYPERV_CPUID_
ISOLATION_CONFIG. The access physical address of the shared memory
should be bounce buffer memory GPA plus with shared_gpa_boundary
reported by CPUID.

Change since v2:
       - Remove not UIO driver in Isolation VM patch
       - Use vmap_pfn() to replace ioremap_page_range function in
       order to avoid exposing symbol ioremap_page_range() and
       ioremap_page_range()
       - Call hv set mem host visibility hvcall in set_memory_encrypted/decrypted()
       - Enable swiotlb force mode instead of adding Hyper-V dma map/unmap hook
       - Fix code style

Tianyu Lan (11):
  x86/HV: Initialize GHCB page in Isolation VM
  x86/HV: Initialize shared memory boundary in the Isolation VM.
  x86/Hyper-V: Add new hvcall guest address host visibility support
  HV: Add Write/Read MSR registers via ghcb
  HV: Add ghcb hvcall support for SNP VM
  HV/Vmbus: Add SNP support for VMbus channel initiate message
  HV/Vmbus: Initialize VMbus ring buffer for Isolation VM
  swiotlb: Add bounce buffer remap address setting function
  HV/IOMMU: Enable swiotlb bounce buffer for Isolation VM
  HV/Netvsc: Add Isolation VM support for netvsc driver
  HV/Storvsc: Add Isolation VM support for storvsc driver

 arch/x86/hyperv/Makefile           |   2 +-
 arch/x86/hyperv/hv_init.c          |  70 +++++--
 arch/x86/hyperv/ivm.c              | 300 +++++++++++++++++++++++++++++
 arch/x86/include/asm/hyperv-tlfs.h |  24 +++
 arch/x86/include/asm/mshyperv.h    |  85 +++++++-
 arch/x86/kernel/cpu/mshyperv.c     |   5 +
 arch/x86/mm/pat/set_memory.c       |  10 +-
 arch/x86/xen/pci-swiotlb-xen.c     |   3 +-
 drivers/hv/Kconfig                 |   1 +
 drivers/hv/channel.c               |  48 ++++-
 drivers/hv/connection.c            |  68 ++++++-
 drivers/hv/hv.c                    | 122 ++++++++----
 drivers/hv/hyperv_vmbus.h          |   3 +
 drivers/hv/ring_buffer.c           |  84 ++++++--
 drivers/hv/vmbus_drv.c             |   3 +
 drivers/iommu/hyperv-iommu.c       |  81 ++++++++
 drivers/net/hyperv/hyperv_net.h    |   6 +
 drivers/net/hyperv/netvsc.c        | 125 +++++++++++-
 drivers/net/hyperv/rndis_filter.c  |   3 +
 drivers/scsi/storvsc_drv.c         |  63 +++++-
 include/asm-generic/hyperv-tlfs.h  |   1 +
 include/asm-generic/mshyperv.h     |  18 +-
 include/linux/hyperv.h             |  16 ++
 include/linux/swiotlb.h            |   5 +
 kernel/dma/swiotlb.c               |  14 +-
 25 files changed, 1062 insertions(+), 98 deletions(-)
 create mode 100644 arch/x86/hyperv/ivm.c

-- 
2.25.1

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
