Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E405127EF2
	for <lists.iommu@lfdr.de>; Fri, 20 Dec 2019 16:03:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 132CB870B5;
	Fri, 20 Dec 2019 15:03:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ldtB-QyZrj3a; Fri, 20 Dec 2019 15:03:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id F2F9987096;
	Fri, 20 Dec 2019 15:03:20 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9189C077D;
	Fri, 20 Dec 2019 15:03:20 +0000 (UTC)
X-Original-To: iommu@lists.linuxfoundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 77EC9C077D
 for <iommu@lists.linuxfoundation.org>; Fri, 20 Dec 2019 15:03:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 6022A20399
 for <iommu@lists.linuxfoundation.org>; Fri, 20 Dec 2019 15:03:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h0IpnhZL1JrG for <iommu@lists.linuxfoundation.org>;
 Fri, 20 Dec 2019 15:03:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by silver.osuosl.org (Postfix) with ESMTPS id 01C5A20119
 for <iommu@lists.linuxfoundation.org>; Fri, 20 Dec 2019 15:03:18 +0000 (UTC)
Received: from localhost (mobile-166-170-223-177.mycingular.net
 [166.170.223.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B35D21655;
 Fri, 20 Dec 2019 15:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1576854197;
 bh=CPY22g81OiRavk7/O94Lph0D5YCaRfHVDFMECFgqwe8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=cY0BevEbdLDwsL1Ocs55xioO9NT9DJ4cSwjnN9hMVYH8rxx7hewQXPNFXvrgmGRHN
 HQWw3E8LZhoRR5snduR0sw8QBdkr2bSZQl9mAYCww3KXvlzpiGiUKVCtiDu1/1NQm9
 I0XBzXYS8VR8q5pJaAqX06moFepjoThNNAvQycaM=
Date: Fri, 20 Dec 2019 09:03:15 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH v4 03/16] PCI/ATS: Restore EXPORT_SYMBOL_GPL() for
 pci_{enable,disable}_ats()
Message-ID: <20191220150315.GA97598@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191220084303.GA9347@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: iommu@lists.linuxfoundation.org,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Saravana Kannan <saravanak@google.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>,
 Joerg Roedel <jroedel@suse.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Greg Kroah-Hartman <gregkh@google.com>, kernel-team@android.com,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>
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

On Fri, Dec 20, 2019 at 09:43:03AM +0100, Joerg Roedel wrote:
> Hi Bjorn,
> 
> On Thu, Dec 19, 2019 at 12:03:39PM +0000, Will Deacon wrote:
> > From: Greg Kroah-Hartman <gregkh@google.com>
> > 
> > Commit d355bb209783 ("PCI/ATS: Remove unnecessary EXPORT_SYMBOL_GPL()")
> > unexported a bunch of symbols from the PCI core since the only external
> > users were non-modular IOMMU drivers. Although most of those symbols
> > can remain private for now, 'pci_{enable,disable_ats()' is required for
> > the ARM SMMUv3 driver to build as a module, otherwise we get a build
> > failure as follows:
> > 
> >   | ERROR: "pci_enable_ats" [drivers/iommu/arm-smmu-v3.ko] undefined!
> >   | ERROR: "pci_disable_ats" [drivers/iommu/arm-smmu-v3.ko] undefined!
> > 
> > Re-export these two functions so that the ARM SMMUv3 driver can be build
> > as a module.
> > 
> > Cc: Bjorn Helgaas <bhelgaas@google.com>
> > Cc: Joerg Roedel <jroedel@suse.de>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@google.com>
> > [will: rewrote commit message]
> > Signed-off-by: Will Deacon <will@kernel.org>
> > ---
> >  drivers/pci/ats.c | 2 ++
> >  1 file changed, 2 insertions(+)
> 
> Are you fine with this change? I would apply this series to my tree
> then.

Yep, thanks!  You can add my

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
