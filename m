Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 55E9D7476C
	for <lists.iommu@lfdr.de>; Thu, 25 Jul 2019 08:43:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4D30E162F;
	Thu, 25 Jul 2019 06:43:32 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7BD061615
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 06:43:31 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from kirsty.vergenet.net (kirsty.vergenet.net [202.4.237.240])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id 56522B0
	for <iommu@lists.linux-foundation.org>;
	Thu, 25 Jul 2019 06:43:30 +0000 (UTC)
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
	by kirsty.vergenet.net (Postfix) with ESMTPA id 7687125BE52;
	Thu, 25 Jul 2019 16:33:46 +1000 (AEST)
Received: by penelope.horms.nl (Postfix, from userid 7100)
	id 64AD9E2209B; Thu, 25 Jul 2019 08:33:44 +0200 (CEST)
Date: Thu, 25 Jul 2019 08:33:44 +0200
From: Simon Horman <horms@verge.net.au>
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH v8 3/5] block: sort headers on blk-setting.c
Message-ID: <20190725063343.affvy6fzrn5iehvr@verge.net.au>
References: <1563859608-19456-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1563859608-19456-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1563859608-19456-4-git-send-email-yoshihiro.shimoda.uh@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: axboe@kernel.dk, linux-renesas-soc@vger.kernel.org, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, linux-block@vger.kernel.org,
	wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org, robin.murphy@arm.com, hch@lst.de
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

On Tue, Jul 23, 2019 at 02:26:46PM +0900, Yoshihiro Shimoda wrote:
> This patch sorts the headers in alphabetic order to ease
> the maintenance for this part.
> 
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
