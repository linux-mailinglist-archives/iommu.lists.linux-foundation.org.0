Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FF31FC6E9
	for <lists.iommu@lfdr.de>; Wed, 17 Jun 2020 09:13:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 0577E88443;
	Wed, 17 Jun 2020 07:13:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2SGMV2Zdebk; Wed, 17 Jun 2020 07:13:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7801A8850A;
	Wed, 17 Jun 2020 07:13:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6288CC016E;
	Wed, 17 Jun 2020 07:13:56 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 729EAC016E
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:13:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6ECDF877AA
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:13:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GyLvvzlEqSvT for <iommu@lists.linux-foundation.org>;
 Wed, 17 Jun 2020 07:13:52 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 2CE4B8778C
 for <iommu@lists.linux-foundation.org>; Wed, 17 Jun 2020 07:13:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EA99B68AEF; Wed, 17 Jun 2020 09:13:45 +0200 (CEST)
Date: Wed, 17 Jun 2020 09:13:45 +0200
From: Christoph Hellwig <hch@lst.de>
To: Vladimir Murzin <vladimir.murzin@arm.com>
Subject: Re: [PATCH] dma-direct: enable mmap for !CONFIG_MMU
Message-ID: <20200617071345.GA12912@lst.de>
References: <20200615070542.43761-1-hch@lst.de>
 <0f7dd526-653f-bbb3-f9bd-b6923ce7ba8c@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0f7dd526-653f-bbb3-f9bd-b6923ce7ba8c@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Cc: iommu@lists.linux-foundation.org, dillon min <dillon.minfei@gmail.com>,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Tue, Jun 16, 2020 at 01:02:11PM +0100, Vladimir Murzin wrote:
> LGTM. Should it go stable as well?

I think it will be picked up automatically eventually due to the Fixes
tag.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
