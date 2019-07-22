Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1867033B
	for <lists.iommu@lfdr.de>; Mon, 22 Jul 2019 17:12:06 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id E7E3ECB8;
	Mon, 22 Jul 2019 15:12:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 93FD2C58
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 15:12:03 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30362224
	for <iommu@lists.linux-foundation.org>;
	Mon, 22 Jul 2019 15:11:55 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 330FA447; Mon, 22 Jul 2019 17:11:53 +0200 (CEST)
Date: Mon, 22 Jul 2019 17:11:51 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Sai Praneeth Prakhya <sai.praneeth.prakhya@intel.com>
Subject: Re: [PATCH RFC 1/4] iommu/vt-d: Modify device_def_domain_type() to
	use at runtime
Message-ID: <20190722151151.GD12009@8bytes.org>
References: <cover.1562116655.git.sai.praneeth.prakhya@intel.com>
	<f83f7a321c31e4747488c7787d53315fa25e9a31.1562116655.git.sai.praneeth.prakhya@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f83f7a321c31e4747488c7787d53315fa25e9a31.1562116655.git.sai.praneeth.prakhya@intel.com>
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

On Tue, Jul 02, 2019 at 06:53:59PM -0700, Sai Praneeth Prakhya wrote:
> device_def_domain_type() determines the domain type a device could have and
> it's called only during boot. But, to change the domain of a group through
> sysfs, kernel has to call this function during runtime. Hence, add an
> argument to the function which lets the function know if it's being called
> at boot time or runtime.

I don't think it should make a difference when the function is actually
called. The sysfs input is just another variable to take into account
when the default domain type is determined.

What I'd like to see for example is that I can write 'auto' to the file
and get back the systems decision for the default domain type. I'd also
like to be able to forbid changing the type for e.g.  Thunderbolt
connected devices.


Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
