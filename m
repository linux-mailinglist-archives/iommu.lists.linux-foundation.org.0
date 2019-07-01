Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9601E4C2B3
	for <lists.iommu@lfdr.de>; Wed, 19 Jun 2019 23:05:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 80EF9CA8;
	Wed, 19 Jun 2019 21:05:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id AE60EC91
	for <iommu@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 21:05:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from iolanthe.rowland.org (iolanthe.rowland.org [192.131.102.54])
	by smtp1.linuxfoundation.org (Postfix) with SMTP id A7634E6
	for <iommu@lists.linux-foundation.org>;
	Wed, 19 Jun 2019 21:05:50 +0000 (UTC)
Received: (qmail 10848 invoked by uid 2102); 19 Jun 2019 17:05:49 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
	by localhost with SMTP; 19 Jun 2019 17:05:49 -0400
Date: Wed, 19 Jun 2019 17:05:49 -0400 (EDT)
From: Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To: shuah <shuah@kernel.org>
Subject: Re: How to resolve an issue in swiotlb environment?
In-Reply-To: <7a6450cd-7b68-778d-0124-3c21d4616069@kernel.org>
Message-ID: <Pine.LNX.4.44L0.1906191649350.1596-100000@iolanthe.rowland.org>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
	Valentina Manea <valentina.manea.m@gmail.com>,
	"linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Christoph Hellwig <hch@lst.de>
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

On Wed, 19 Jun 2019, shuah wrote:

> I missed a lot of the thread info. and went looking for it and found the
> following summary of the problem:
> 
> ==================
> The issue which prompted the commit this thread is about arose in a
> situation where the block layer set up a scatterlist containing buffer
> sizes something like:
> 
> 	4096 4096 1536 1024
> 
> and the maximum packet size was 1024.  The situation was a little
> unusual, because it involved vhci-hcd (a virtual HCD).  This doesn't
> matter much in normal practice because:
> 
> 	Block devices normally have a block size of 512 bytes or more.
> 	Smaller values are very uncommon.  So scatterlist element sizes
> 	are always divisible by 512.
> 
> 	xHCI is the only USB host controller type with a maximum packet
> 	size larger than 512, and xHCI hardware can do full
> 	scatter-gather so it doesn't care what the buffer sizes are.
> 
> So another approach would be to fix vhci-hcd and then trust that the
> problem won't arise again, for the reasons above.  We would be okay so
> long as nobody tried to use a USB-SCSI device with a block size of 256
> bytes or less.
> ===================
> 
> Out of the summary, the following gives me pause:
> 
> "xHCI hardware can do full scatter-gather so it doesn't care what the
> buffer sizes are."
> 
> vhci-hcd won't be able to count on hardware being able to do full
> scatter-gather. It has to deal with a variety of hardware with
> varying speeds.

Sure.  But you can test whether the server's HCD is able to handle 
scatter-gather transfers, and if it is then you can say that the 
client-side vhci-hcd is able to handle them as well.  Then all you 
would have to do is preserve the scatterlist information describing the 
transfer when you go between the client and the server.

The point is to make sure that the client-side vhci-hcd doesn't claim
to be _less_ capable than the server-side actual HCD.  That's what
leads to the problem described above.

> "We would be okay so long as nobody tried to use a USB-SCSI device with
> a block size of 256 bytes or less."
> 
> At least a USB Storage device, I test with says 512 block size. Can we
> count on not seeing a device with block size <= 256 bytes?

Yes, we can.  In fact, the SCSI core doesn't handle devices with block 
size < 512.

> In any case, I am looking into adding SG support vhci-hci at the moment.
> 
> Looks like the following is the repo, I should be working with?
> 
> git://git.infradead.org/users/hch/misc.git

It doesn't matter.  Your work should end up being independent of 
Christoph's, so you can base it on any repo.

Alan Stern

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
