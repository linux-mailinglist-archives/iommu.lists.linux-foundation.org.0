Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F3335D8E6
	for <lists.iommu@lfdr.de>; Tue, 13 Apr 2021 09:32:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E25F2400DF;
	Tue, 13 Apr 2021 07:32:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E2zuZhrh_pxG; Tue, 13 Apr 2021 07:32:35 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id D8B9F400DC;
	Tue, 13 Apr 2021 07:32:34 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AEE8AC000A;
	Tue, 13 Apr 2021 07:32:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 1195DC000A
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 07:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E3A4A40667
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 07:32:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=linuxfoundation.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8vow8TeLBpwu for <iommu@lists.linux-foundation.org>;
 Tue, 13 Apr 2021 07:32:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F18604066C
 for <iommu@lists.linux-foundation.org>; Tue, 13 Apr 2021 07:32:31 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id D341761019;
 Tue, 13 Apr 2021 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1618299151;
 bh=NXAlmsVssbNaMP8SFM64V4f9tP7FA7/C7BSu9Mpzc0w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=v2rJrZ0vpAWX4TqaQkiHsp6irNdzTpp1FDSIB4nWJQztQAuv+ESx2iir5UghNQwzA
 fNY5+fmQT8yCkgJj4A3k079sj9tT7LNRFk1TFNsnXe9KpANuxGlDzYL+CNQPLBlMPv
 0iB9fFmw8KUz0NGfs+bvU2JzrVp+6fzMX2pmYotI=
Date: Tue, 13 Apr 2021 09:32:28 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
Subject: Re: [PATCH 5.4 v3 1/1] iommu/vt-d: Fix agaw for a supported 48 bit
 guest address width
Message-ID: <YHVJDM4CXINrO1KE@kroah.com>
References: <20210412202736.70765-1-saeed.mirzamohammadi@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210412202736.70765-1-saeed.mirzamohammadi@oracle.com>
Cc: saeed.mirzamohammadi@oracle.com, Camille Lu <camille.lu@hpe.com>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

<meta comment, please fix your email client to put proper things in the
 To: line so that we can correctly respond to patches...>

On Mon, Apr 12, 2021 at 01:27:35PM -0700, Saeed Mirzamohammadi wrote:
> The IOMMU driver calculates the guest addressability for a DMA request
> based on the value of the mgaw reported from the IOMMU. However, this
> is a fused value and as mentioned in the spec, the guest width
> should be calculated based on the minimum of supported adjusted guest
> address width (SAGAW) and MGAW.
> 
> This is from specification:
> "Guest addressability for a given DMA request is limited to the
> minimum of the value reported through this field and the adjusted
> guest address width of the corresponding page-table structure.
> (Adjusted guest address widths supported by hardware are reported
> through the SAGAW field)."
> 
> This causes domain initialization to fail and following
> errors appear for EHCI PCI driver:
> 
> [    2.486393] ehci-pci 0000:01:00.4: EHCI Host Controller
> [    2.486624] ehci-pci 0000:01:00.4: new USB bus registered, assigned bus
> number 1
> [    2.489127] ehci-pci 0000:01:00.4: DMAR: Allocating domain failed
> [    2.489350] ehci-pci 0000:01:00.4: DMAR: 32bit DMA uses non-identity
> mapping
> [    2.489359] ehci-pci 0000:01:00.4: can't setup: -12
> [    2.489531] ehci-pci 0000:01:00.4: USB bus 1 deregistered
> [    2.490023] ehci-pci 0000:01:00.4: init 0000:01:00.4 fail, -12
> [    2.490358] ehci-pci: probe of 0000:01:00.4 failed with error -12
> 
> This issue happens when the value of the sagaw corresponds to a
> 48-bit agaw. This fix updates the calculation of the agaw based on
> the minimum of IOMMU's sagaw value and MGAW.
> 
> Cc: stable@vger.kernel.org
> Signed-off-by: Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>
> Tested-by: Camille Lu <camille.lu@hpe.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>

What is the git commit id of this patch in Linus's tree?

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
