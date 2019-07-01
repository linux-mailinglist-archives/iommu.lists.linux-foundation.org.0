Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 95121433C3
	for <lists.iommu@lfdr.de>; Thu, 13 Jun 2019 09:39:33 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7D42CB5F;
	Thu, 13 Jun 2019 07:39:31 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id E1AEA949
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 07:39:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 7466B174
	for <iommu@lists.linux-foundation.org>;
	Thu, 13 Jun 2019 07:39:29 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id D867268B02; Thu, 13 Jun 2019 09:39:00 +0200 (CEST)
Date: Thu, 13 Jun 2019 09:39:00 +0200
From: Christoph Hellwig <hch@lst.de>
To: Alan Stern <stern@rowland.harvard.edu>
Subject: Re: How to resolve an issue in swiotlb environment?
Message-ID: <20190613073900.GC12093@lst.de>
References: <20190612120653.GA25285@lst.de>
	<Pine.LNX.4.44L0.1906121038210.1557-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1906121038210.1557-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	Oliver Neukum <oneukum@suse.com>,
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

On Wed, Jun 12, 2019 at 10:43:11AM -0400, Alan Stern wrote:
> Would it be okay to rely on the assumption that USB block devices never 
> have block size < 512?  (We could even add code to the driver to 
> enforce this, although refusing to handle such devices at all might be 
> worse than getting an occasional error.)

sd.c only supports a few specific sector size, and none of them is
< 512 bytes:

	if (sector_size != 512 &&
	    sector_size != 1024 &&
	    sector_size != 2048 &&
	    sector_size != 4096) {
	    	...
		sdkp->capacity = 0;
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
