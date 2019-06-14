Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 13A0445D6E
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 15:04:28 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2340FC7D;
	Fri, 14 Jun 2019 13:04:26 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 3E01FC6A
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:04:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id B6F7F174
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 13:04:23 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 28B3568B02; Fri, 14 Jun 2019 15:03:54 +0200 (CEST)
Date: Fri, 14 Jun 2019 15:03:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jon Mason <jdmason@kudzu.us>
Subject: Re: status of the calgary iommu driver
Message-ID: <20190614130353.GA1036@lst.de>
References: <20190409140347.GA11524@lst.de>
	<CAPoiz9wwMCRkzM5FWm18kecC1=kt+5qPNHmQ7eUFhH=3ZNAqYw@mail.gmail.com>
	<20190508175219.GA32030@lst.de>
	<CAPoiz9zQuJ0-9wJBNo=Wvi9qquyid9vjmHODy=VJad_PE=cgdA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPoiz9zQuJ0-9wJBNo=Wvi9qquyid9vjmHODy=VJad_PE=cgdA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-kernel <linux-kernel@vger.kernel.org>,
	iommu@lists.linux-foundation.org, x86@kernel.org,
	Christoph Hellwig <hch@lst.de>, Muli Ben-Yehuda <mulix@mulix.org>
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

On Wed, May 08, 2019 at 06:56:46PM +0100, Jon Mason wrote:
> I do have a system.  So, it could be tested.  However given the age of
> the HW, I would say it is not worth the effort to update and it would
> be best to remove it from the kernel.
> 
> I can send a patch to do this, unless you would prefer to do it (or
> already have something handy).

Do you still plan to send that patch?
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
