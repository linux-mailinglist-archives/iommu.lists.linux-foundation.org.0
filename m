Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id A7F3C28709B
	for <lists.iommu@lfdr.de>; Thu,  8 Oct 2020 10:23:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 8C4EC86A72;
	Thu,  8 Oct 2020 08:22:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7tKtelF6qKmg; Thu,  8 Oct 2020 08:22:58 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 1CB4386A5B;
	Thu,  8 Oct 2020 08:22:58 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 01244C0051;
	Thu,  8 Oct 2020 08:22:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id D50CEC0051
 for <iommu@lists.linux-foundation.org>; Thu,  8 Oct 2020 08:22:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id BA7B586A5B
 for <iommu@lists.linux-foundation.org>; Thu,  8 Oct 2020 08:22:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXdb7YPojrbK for <iommu@lists.linux-foundation.org>;
 Thu,  8 Oct 2020 08:22:55 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 5166686A42
 for <iommu@lists.linux-foundation.org>; Thu,  8 Oct 2020 08:22:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id EBE192FB; Thu,  8 Oct 2020 10:22:51 +0200 (CEST)
Date: Thu, 8 Oct 2020 10:22:49 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Subject: Re: [Bug 209321] DMAR: [DMA Read] Request device [03:00.0] PASID
 ffffffff fault addr fffd3000 [fault reason 06] PTE Read access is not set
Message-ID: <20201008082249.GA3107@8bytes.org>
References: <20201007154314.GA3245607@bjorn-Precision-5520>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201007154314.GA3245607@bjorn-Precision-5520>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: linux-pci@vger.kernel.org, iommu@lists.linux-foundation.org,
 Len Brown <lenb@kernel.org>, linux-kernel@vger.kernel.org,
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

Hi Bjorn,

On Wed, Oct 07, 2020 at 10:43:14AM -0500, Bjorn Helgaas wrote:
> https://bugzilla.kernel.org/show_bug.cgi?id=209321
> 
> Not much detail in the bugzilla yet, but apparently this started in
> v5.8.0-rc1:
> 
>   DMAR: [DMA Read] Request device [03:00.0] PASID ffffffff fault addr fffd3000 [fault reason 06] PTE Read access is not set
> 
> Currently assigned to Driver/PCI, but not clear to me yet whether PCI
> is the culprit or the victim.

Thanks for the heads-up, looks like Intel is already on it.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
