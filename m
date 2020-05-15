Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 0910F1D4D95
	for <lists.iommu@lfdr.de>; Fri, 15 May 2020 14:21:23 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id A8FD6203F7;
	Fri, 15 May 2020 12:21:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L1gwxnDOsFKb; Fri, 15 May 2020 12:21:16 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id C3C4A2E5EC;
	Fri, 15 May 2020 12:21:16 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 9F56EC016F;
	Fri, 15 May 2020 12:21:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F2FECC016F
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 12:21:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DF95F203F7
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 12:21:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pfpB0ybGxvkP for <iommu@lists.linux-foundation.org>;
 Fri, 15 May 2020 12:21:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
 by silver.osuosl.org (Postfix) with ESMTPS id 7B1E62E8B0
 for <iommu@lists.linux-foundation.org>; Fri, 15 May 2020 12:21:08 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
 id DEA45379; Fri, 15 May 2020 14:21:05 +0200 (CEST)
Date: Fri, 15 May 2020 14:21:04 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Subject: Re: [PATCH 2/4] iommu/amd: Use pci_ats_supported()
Message-ID: <20200515122104.GV18353@8bytes.org>
References: <20200515104359.1178606-1-jean-philippe@linaro.org>
 <20200515104359.1178606-3-jean-philippe@linaro.org>
 <20200515120150.GU18353@8bytes.org>
 <20200515121124.GA784024@myrica>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200515121124.GA784024@myrica>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: alex.williamson@redhat.com, ashok.raj@intel.com, linux-pci@vger.kernel.org,
 robin.murphy@arm.com, iommu@lists.linux-foundation.org, bhelgaas@google.com,
 will@kernel.org, dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
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

On Fri, May 15, 2020 at 02:11:24PM +0200, Jean-Philippe Brucker wrote:
> On Fri, May 15, 2020 at 02:01:50PM +0200, Joerg Roedel wrote:
> > Hmm, but per patch 1, pci_ats_supported() does not check
> > pci_ats_disabled(), or do I miss something?
> 
> The commit message isn't clear. pci_ats_init() sets dev->ats_cap only if
> !pci_ats_disabled(), so checking dev->ats_cap in pci_ats_supported()
> takes pci_ats_disabled() into account.

Right, so the patch is fine:

Reviewed-by: Joerg Roedel <jroedel@suse.de>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
