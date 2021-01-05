Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8192EB307
	for <lists.iommu@lfdr.de>; Tue,  5 Jan 2021 20:04:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id D40C98610F;
	Tue,  5 Jan 2021 19:04:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2m4Uz71nEudP; Tue,  5 Jan 2021 19:04:51 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 6ABA9855EF;
	Tue,  5 Jan 2021 19:04:51 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 5185FC013A;
	Tue,  5 Jan 2021 19:04:51 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 68E3CC013A
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jan 2021 19:04:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 63F2C855EF
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jan 2021 19:04:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VvbQQerufvsw for <iommu@lists.linux-foundation.org>;
 Tue,  5 Jan 2021 19:04:49 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 0AA7385550
 for <iommu@lists.linux-foundation.org>; Tue,  5 Jan 2021 19:04:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3E6AA22D5B;
 Tue,  5 Jan 2021 19:04:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1609873488;
 bh=pdXRW916AxUwPNH0kbaMgbe9akT1S9yC68nIHVv6WCY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Can7n0XI6x+F1komFvkalUvv/x7rXUScyw9/9a0C3+bDiPdqzD4xLrOCtLaXzpeBU
 1gBZ5w5GpyUdxf4dwuET/BE/ul0xSGcViKsDl09rIruNaRgZ0c1dOQkV2HLlhZYiO7
 F2dwAYmCeyAWavyKHFvJWByFNocak2A51pTJgDl03Cl6//+l7A+XjBe4kV1eTP8W41
 dh/gAJWdTQCWkV9L48A7bb+1ujJ/CEzFCz7BraSbDL9CJJOraRLzj0+KBpiMkgQ/W7
 Z+8h5QFeBvhgEO/sReSWgFkGuEyW+Kgixxeo0mkfqKfmsnzhW63qEyB5ZwNuTD3WfF
 gr47l397khkEQ==
Date: Tue, 5 Jan 2021 19:04:43 +0000
From: Will Deacon <will@kernel.org>
To: Lu Baolu <baolu.lu@linux.intel.com>
Subject: Re: [PATCH 3/5] iommu/vt-d: Remove unused dma map/unmap trace events
Message-ID: <20210105190443.GB12182@willie-the-truck>
References: <20201231005323.2178523-1-baolu.lu@linux.intel.com>
 <20201231005323.2178523-3-baolu.lu@linux.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201231005323.2178523-3-baolu.lu@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: Ashok Raj <ashok.raj@intel.com>, linux-kernel@vger.kernel.org,
 iommu@lists.linux-foundation.org, Guo Kaijie <Kaijie.Guo@intel.com>
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

On Thu, Dec 31, 2020 at 08:53:21AM +0800, Lu Baolu wrote:
> With commit c588072bba6b5 ("iommu/vt-d: Convert intel iommu driver to
> the iommu ops"), the trace events for dma map/unmap have no users any
> more. Remove them so that they don't show up under
> /sys/kernel/debug/tracing/events/intel_iommu. The users should use the
> map/unmap traces defined in the iommu core from now on.
> 
> Fixes: c588072bba6b5 ("iommu/vt-d: Convert intel iommu driver to the iommu ops")
> Signed-off-by: Lu Baolu <baolu.lu@linux.intel.com>
> ---
>  include/trace/events/intel_iommu.h | 119 -----------------------------
>  1 file changed, 119 deletions(-)

Is this needed in 5.11, or can it wait until 5.12?

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
