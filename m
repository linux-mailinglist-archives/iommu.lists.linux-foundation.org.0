Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B94667D7F6
	for <lists.iommu@lfdr.de>; Thu,  1 Aug 2019 10:45:18 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D0A7A8A88;
	Thu,  1 Aug 2019 08:45:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 28C768A81
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 08:35:07 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
	[85.220.165.71])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id BF5B07ED
	for <iommu@lists.linux-foundation.org>;
	Thu,  1 Aug 2019 08:35:06 +0000 (UTC)
Received: from kresse.hi.pengutronix.de ([2001:67c:670:100:1d::2a])
	by metis.ext.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <l.stach@pengutronix.de>)
	id 1ht6YB-0001hP-N0; Thu, 01 Aug 2019 10:35:03 +0200
Message-ID: <1564648502.7267.27.camel@pengutronix.de>
Subject: Re: large DMA segments vs SWIOTLB
From: Lucas Stach <l.stach@pengutronix.de>
To: Christoph Hellwig <hch@lst.de>
Date: Thu, 01 Aug 2019 10:35:02 +0200
In-Reply-To: <20190801072958.GA16178@lst.de>
References: <1564584029.7267.15.camel@pengutronix.de>
	<20190801072958.GA16178@lst.de>
X-Mailer: Evolution 3.22.6-1+deb9u2 
Mime-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::2a
X-SA-Exim-Mail-From: l.stach@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
	SAEximRunCond expanded to false
X-PTX-Original-Recipient: iommu@lists.linux-foundation.org
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>
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

Hi Christoph,

Am Donnerstag, den 01.08.2019, 09:29 +0200 schrieb Christoph Hellwig:
> Hi Lukas,
> 
> have you tried the latest 5.3-rc kernel, where we limited the NVMe
> I/O size based on the swiotlb buffer size?

Yes, the issue was reproduced on 5.3-rc2. I now see your commit
limiting the request size, so I guess I need to dig in to see why I'm
still getting requests larger than the SWIOTLB max segment size. Thanks
for the pointer!

Regards,
Lucas
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
