Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id BF90DF4549
	for <lists.iommu@lfdr.de>; Fri,  8 Nov 2019 12:03:20 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5264113AF;
	Fri,  8 Nov 2019 11:03:16 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6709A1389
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 11:03:15 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 209D1EC
	for <iommu@lists.linux-foundation.org>;
	Fri,  8 Nov 2019 11:03:15 +0000 (UTC)
Received: from willie-the-truck (236.31.169.217.in-addr.arpa [217.169.31.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
	bits)) (No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id C72EF206BA;
	Fri,  8 Nov 2019 11:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1573210994;
	bh=J/Gsm5N/mj+ik5tmWzF15ve/593DRKXBLK4N9zKCikI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GPUpB2qieVF3EyX+Obw28FlE6xo23nwE/xykonNN3EZtnaxcpvEFeX+8ufsaXb5th
	+ksXQteLE30PzN2sUWXuJdcrvuV/YqSRLbHtKk9h1qsPcUG586CeeZJJMYvyQclJah
	tyoRDGyrsSCcnNRNjplrIRLCVouz6GYQbwN+T1LQ=
Date: Fri, 8 Nov 2019 11:03:10 +0000
From: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH 5/7] iommu/arm-smmu-v3: Allow building as a module
Message-ID: <20191108110310.GC19153@willie-the-truck>
References: <20191030145112.19738-1-will@kernel.org>
	<20191030145112.19738-6-will@kernel.org>
	<20191030193148.GA8432@8bytes.org>
	<20191031154247.GB28061@willie-the-truck>
	<20191105121508.GA3479@8bytes.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191105121508.GA3479@8bytes.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Bjorn Helgaas <bhelgaas@google.com>, iommu@lists.linux-foundation.org,
	Robin Murphy <robin.murphy@arm.com>, linux-kernel@vger.kernel.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
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
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

Hi Joerg,

On Tue, Nov 05, 2019 at 01:15:08PM +0100, Joerg Roedel wrote:
> On Thu, Oct 31, 2019 at 03:42:47PM +0000, Will Deacon wrote:
> > Generally, I think unloading the IOMMU driver module while there are
> > active users is a pretty bad idea, much like unbinding the driver via
> > /sys in the same situation would also be fairly daft. However, I *think*
> > the code in __device_release_driver() tries to deal with this by
> > iterating over the active consumers and ->remove()ing them first.
> > 
> > I'm without hardware access at the moment, so I haven't been able to
> > test this myself. We could nobble the module_exit() hook, but there's
> > still the "force unload" option depending on the .config.
> 
> Okay, but besides the force-unload case, can we prevent accidential
> unloading by taking a reference to the module in add_device() and release
> it in remove_device()?

That's probably a sensible starting point, yes. In conjunction with the
patch from Jean-Philippe to introduce bus_unset_iommu(), we might have
a fighting chance of getting this to work.

I'll spin a v2.

Thanks!

Will
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
