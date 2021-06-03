Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDFE3997E0
	for <lists.iommu@lfdr.de>; Thu,  3 Jun 2021 04:10:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C9ED94057D;
	Thu,  3 Jun 2021 02:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R63rAZ91dVeX; Thu,  3 Jun 2021 02:10:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA78140510;
	Thu,  3 Jun 2021 02:10:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 8CAAFC0024;
	Thu,  3 Jun 2021 02:10:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A2AF8C0001;
 Thu,  3 Jun 2021 00:41:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8326483D3C;
 Thu,  3 Jun 2021 00:41:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiJMTyGt9W3t; Thu,  3 Jun 2021 00:41:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D2B0883D34;
 Thu,  3 Jun 2021 00:41:45 +0000 (UTC)
IronPort-SDR: 3lrjHO26w4dfXWkQAK3EW2GB7+KmeKtx4We+h/AgJDhDB1GN6DNbqwsJMli/i9X8EghOq+vasY
 0nS4d2cmkFog==
X-IronPort-AV: E=McAfee;i="6200,9189,10003"; a="191281572"
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="191281572"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 17:41:44 -0700
IronPort-SDR: dhLv57dz9HwwibPiEYbHtPMONcCxCLxcsR6TEmsybaNnFlLNXLEmFLYBV1Mc+W09uoYz9GxbpY
 /iz4i02nlxTg==
X-IronPort-AV: E=Sophos;i="5.83,244,1616482800"; d="scan'208";a="549686674"
Received: from tassilo.jf.intel.com ([10.54.74.11])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jun 2021 17:41:44 -0700
From: Andi Kleen <ak@linux.intel.com>
To: mst@redhat.com
Subject: Virtio hardening for TDX
Date: Wed,  2 Jun 2021 17:41:25 -0700
Message-Id: <20210603004133.4079390-1-ak@linux.intel.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 03 Jun 2021 02:10:48 +0000
Cc: jasowang@redhat.com, x86@kernel.org, linux-kernel@vger.kernel.org,
 virtualization@lists.linux-foundation.org, iommu@lists.linux-foundation.org,
 jpoimboe@redhat.com, robin.murphy@arm.com, hch@lst.de
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

[v1: Initial post]

With confidential computing like TDX the guest doesn't trust the host
anymore. The host is allowed to DOS of course, but it is not allowed
to read or write any guest memory not explicitely shared with it.

This has implication for virtio. Traditionally virtio didn't assume
the other side of the communication channel is malicious, and therefore
didn't do any boundary checks in virtio ring data structures.

This patchkit does hardening for virtio.  In a TDX like model
the only host memory accesses allowed are in the virtio ring, 
as well as the (forced) swiotlb buffer.

This patch kit does various changes to ensure there can be no
access outside these two areas. It is possible for the host
to break the communication, but this should result in a IO
error on the guest, but no memory safety violations.

virtio is quite complicated with many modes. To simplify
the task we enforce that virtio is only in split mode without
indirect descriptors, when running as a TDX guest. We also
enforce use of the DMA API.

Then these code paths are hardened against any corruptions
on the ring.

This patchkit has components in three subsystems:
- Hardening changes to virtio, all in the generic virtio-ring
- Hardening changes to kernel/dma swiotlb to harden swiotlb against
malicious pointers. It requires an API change which needed a tree sweep.
- A single x86 patch to enable the arch_has_restricted_memory_access
for TDX

It depends on Sathya's earlier patchkit that adds the basic infrastructure
for TDX. This is only needed for the "am I running in TDX" part.



_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
