Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4457944A87
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 20:18:23 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id F0FCD14B1;
	Thu, 13 Jun 2019 18:18:21 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B274C13CB
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 18:18:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 72036822
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 18:18:20 +0000 (UTC)
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl
	[83.86.89.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id B49802084D;
	Thu, 13 Jun 2019 18:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1560449900;
	bh=UUPjymC9kDajGrf6Y1o5QmQxqZkcGGFGOf881Oi2P7c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Mj/InHz/M4M+7YDI9phQ0DIG8VdygD8QUPunej5bSSU4rFGcDmE4jHNJeEViQxGYN
	xuMJIxmLqPsRFQ8EncILpIvVc/QqtRDjs6f+zfVszunY2mOIk0pY6/xm6RSUVM96XT
	4xYxcFPA1uvSN7C2Tyb1+yI/OVRvRoZl952RVFHc=
Date: Thu, 13 Jun 2019 20:18:17 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190613181817.GA14548@kroah.com>
References: <20190613073900.GC12093@lst.de>
	<Pine.LNX.4.44L0.1906131306580.1307-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906131306580.1307-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_HI autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
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

On Thu, Jun 13, 2019 at 01:16:32PM -0400, Alan Stern wrote:
> On Thu, 13 Jun 2019, Christoph Hellwig wrote:
> 
> > On Wed, Jun 12, 2019 at 10:43:11AM -0400, Alan Stern wrote:
> > > Would it be okay to rely on the assumption that USB block devices never 
> > > have block size < 512?  (We could even add code to the driver to 
> > > enforce this, although refusing to handle such devices at all might be 
> > > worse than getting an occasional error.)
> > 
> > sd.c only supports a few specific sector size, and none of them is
> > < 512 bytes:
> > 
> > 	if (sector_size != 512 &&
> > 	    sector_size != 1024 &&
> > 	    sector_size != 2048 &&
> > 	    sector_size != 4096) {
> > 	    	...
> > 		sdkp->capacity = 0;
> 
> Great!  So all we have to do is fix vhci-hcd.  Then we can remove all 
> the virt_boundary_mask stuff from usb-storage and uas entirely.
> 
> (I'm assuming wireless USB isn't a genuine issue.  As far as I know, it 
> is pretty much abandoned at this point.)

It is, I need to just move it to staging and delete the thing.  I don't
know of any hardware anymore.

thanks,

greg k-h
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
