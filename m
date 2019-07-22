Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 72B2B70287
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 16:41:16 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 26A8BC2C;
	Mon, 22 Jul 2019 14:41:15 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C8FF4AE0
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 14:41:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6A571224
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 14:41:05 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id CF05D1F2; Mon, 22 Jul 2019 16:41:03 +0200 (CEST)
Date: Mon, 22 Jul 2019 16:41:02 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Subject: Re: [PATCH RFC 0/4] iommu: Add support to change default domain of a
	group
Message-ID: <20190722144102.GC12009@8bytes.org>
References: <cover.1562116655.git.sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1562116655.git.sai.praneeth.prakhya@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Ashok Raj <ashok.raj@intel.com>, Will Deacon <will.deacon@arm.com>,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
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

On Tue, Jul 02, 2019 at 06:53:58PM -0700, Sai Praneeth Prakhya wrote:
> Assume a use case where-in the priviliged user would want to use the device in
> pass-through mode when the device is used for host but would want to switch to
> dma protected mode when switching for VFIO in user space. Presently, this is not
> supported and hence add support to change default domain of a group dynamically.

VFIO does it's own iommu magic with the device and moves the group out
of the default domain, so that doesn't sound like a valid use-case. More
valid would be something like putting a device into passthrough mode to
improve performance, or do you have other valid use-cases in mind?


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
