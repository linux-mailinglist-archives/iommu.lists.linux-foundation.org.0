Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A7C245588
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 09:16:47 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 08A60F1D;
	Fri, 14 Jun 2019 07:16:45 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DF9BAF14
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 07:16:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 8AE9FE5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 07:16:43 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
	id 660D968B02; Fri, 14 Jun 2019 09:16:14 +0200 (CEST)
Date: Fri, 14 Jun 2019 09:16:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Wolfram Sang <wsa@the-dreams.de>
Subject: Re: [RFC PATCH v6 1/5] iommu: add an exported function to get
	minimum page size for a domain
Message-ID: <20190614071614.GA8420@lst.de>
References: <1560421215-10750-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<1560421215-10750-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190613193759.GB6863@kunai>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613193759.GB6863@kunai>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: axboe@kernel.dk, linux-renesas-soc@vger.kernel.org, ulf.hansson@linaro.org,
	linux-mmc@vger.kernel.org, hch@lst.de,
	linux-block@vger.kernel.org, wsa+renesas@sang-engineering.com,
	iommu@lists.linux-foundation.org
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

On Thu, Jun 13, 2019 at 09:37:59PM +0200, Wolfram Sang wrote:
> What about making this a 'static inline' in the iommu header file? I'd
> think it is simple enough and would save us the EXPORT symbol.

Agreed, this seems simple enought for an inline.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
