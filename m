Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 38872424B6
	for <lists.iommu@lfdr.de>; Wed, 12 Jun 2019 13:49:01 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 492721B0F;
	Wed, 12 Jun 2019 11:48:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 709341B09
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 11:46:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E9EDB79
	for <iommu@lists.linux-foundation.org>;
	Wed, 12 Jun 2019 11:46:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
	by mx1.suse.de (Postfix) with ESMTP id 15D42AE5A;
	Wed, 12 Jun 2019 11:46:46 +0000 (UTC)
Message-ID: <1560339966.9728.18.camel@suse.com>
Subject: Re: How to resolve an issue in swiotlb environment?
From: Oliver Neukum <oneukum@suse.com>
To: Christoph Hellwig <hch@lst.de>, Alan Stern <stern@rowland.harvard.edu>
Date: Wed, 12 Jun 2019 13:46:06 +0200
In-Reply-To: <20190612073059.GA20086@lst.de>
References: <20190611064158.GA20601@lst.de>
	<Pine.LNX.4.44L0.1906110956510.1535-100000@iolanthe.rowland.org>
	<20190612073059.GA20086@lst.de>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>
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

Am Mittwoch, den 12.06.2019, 09:30 +0200 schrieb Christoph Hellwig:
> 
> So based on the above I'm a little confused about the actual requirement
> again.  Can you still split the SCSI command into multiple URBs?  And

Yes. The device sees only a number of packets over the wire. They can
come from an arbitrary number of URBs with the two restrictions that
- we cannot split a packet among URBs
- every packet but the last must be a multiple of maxpacket

> is the boundary for that split still the scatterlist entry as in the
> description above?  If so I don't really see how the virt_boundary
> helps you at all. as it only guarnatees that in a bio, each subsequent
> segment start as the advertised virt_boundary.  It says nothing about
> the size of each segment.

That is problematic.

> Thay is someething the virt_boundary prevents.  But could still give
> you something like:
> 
> 	1536 4096 4096 1024
> 
> or
> 	1536 16384 8192 4096 16384 512

That would kill the driver, if maxpacket were 1024.

USB has really two kinds of requirements

1. What comes from the protocol
2. What comes from the HCD

The protocol wants just multiples of maxpacket. XHCI can satisfy
that in arbitrary scatter/gather. Other HCs cannot.

	Regards
		Oliver

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
