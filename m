Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 471598352D
	for <lists.iommu@lfdr.de>; Tue,  6 Aug 2019 17:25:35 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 0345BE70;
	Tue,  6 Aug 2019 15:25:34 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 8F6C2E62
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:25:32 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 30E0689D
	for <iommu@lists.linux-foundation.org>;
	Tue,  6 Aug 2019 15:25:32 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id A10883D5; Tue,  6 Aug 2019 17:25:30 +0200 (CEST)
Date: Tue, 6 Aug 2019 17:25:29 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/dma: Handle SG length overflow better
Message-ID: <20190806152529.GB1198@8bytes.org>
References: <fbdbb8c0e550ae559ea3eedc1fea084c0111f202.1564418681.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <fbdbb8c0e550ae559ea3eedc1fea084c0111f202.1564418681.git.robin.murphy@arm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Nicolin Chen <nicoleotsuka@gmail.com>, iommu@lists.linux-foundation.org
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

Hi Robin,

On Mon, Jul 29, 2019 at 05:46:00PM +0100, Robin Murphy wrote:
> Since scatterlist dimensions are all unsigned ints, in the relatively
> rare cases where a device's max_segment_size is set to UINT_MAX, then
> the "cur_len + s_length <= max_len" check in __finalise_sg() will always
> return true. As a result, the corner case of such a device mapping an
> excessively large scatterlist which is mergeable to or beyond a total
> length of 4GB can lead to overflow and a bogus truncated dma_length in
> the resulting segment.
> 
> As we already assume that any single segment must be no longer than
> max_len to begin with, this can easily be addressed by reshuffling the
> comparison.

Has this been triggered in the wild of can this patch wait for the next
merge window?

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
