Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 692EB286263
	for <lists.iommu@lfdr.de>; Wed,  7 Oct 2020 17:43:20 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 1E7BA8728A;
	Wed,  7 Oct 2020 15:43:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7m9THK-ueqnx; Wed,  7 Oct 2020 15:43:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 98DA287288;
	Wed,  7 Oct 2020 15:43:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 78DBDC0051;
	Wed,  7 Oct 2020 15:43:18 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id B71FFC0051
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 15:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 988FA8728A
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 15:43:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oWFbU7Gb1AD9 for <iommu@lists.linux-foundation.org>;
 Wed,  7 Oct 2020 15:43:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 0E76887288
 for <iommu@lists.linux-foundation.org>; Wed,  7 Oct 2020 15:43:17 +0000 (UTC)
Received: from localhost (170.sub-72-107-125.myvzw.com [72.107.125.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3EB3B215A4;
 Wed,  7 Oct 2020 15:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602085396;
 bh=DUJI+Lsncz7wrko4XgbJoI2LwSo1I845y00NncUYbxM=;
 h=Date:From:To:Cc:Subject:From;
 b=LyIvekV8MmYU8u2NeMfsx7cDJDq6K7HqLGFWAplyc1bBmskANj8P6WXRPIqKWrlfT
 tDH2bLV8JvkX66Kll50YQWtDXQgGd78uDeoDiH3K+kOfDu6+mdGGGG4a3hZwbaQypT
 Vpb1Yd5TO8bpy0zAIva1xyKiFgPZlF254n4sNv4w=
Date: Wed, 7 Oct 2020 10:43:14 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org
Subject: [Bug 209321] DMAR: [DMA Read] Request device [03:00.0] PASID
 ffffffff fault addr fffd3000 [fault reason 06] PTE Read access is not set
Message-ID: <20201007154314.GA3245607@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
Cc: Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org,
 Todd Brandt <todd.e.brandt@linux.intel.com>
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

https://bugzilla.kernel.org/show_bug.cgi?id=209321

Not much detail in the bugzilla yet, but apparently this started in
v5.8.0-rc1:

  DMAR: [DMA Read] Request device [03:00.0] PASID ffffffff fault addr fffd3000 [fault reason 06] PTE Read access is not set

Currently assigned to Driver/PCI, but not clear to me yet whether PCI
is the culprit or the victim.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
