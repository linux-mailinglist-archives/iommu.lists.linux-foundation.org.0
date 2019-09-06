Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C89CABD0D
	for <lists.iommu@lfdr.de>; Fri,  6 Sep 2019 17:55:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 4AD7218C9;
	Fri,  6 Sep 2019 15:55:52 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5637614BF
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 15:55:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E235E756
	for <iommu@lists.linux-foundation.org>;
	Fri,  6 Sep 2019 15:55:50 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id F0FDE3AA; Fri,  6 Sep 2019 17:55:48 +0200 (CEST)
Date: Fri, 6 Sep 2019 17:55:48 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] iommu: omap: mark pm functions __maybe_unused
Message-ID: <20190906155548.GA27659@8bytes.org>
References: <20190906151551.1192788-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190906151551.1192788-1-arnd@arndb.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Joerg Roedel <jroedel@suse.de>, linux-kernel@vger.kernel.org,
	Tero Kristo <t-kristo@ti.com>, iommu@lists.linux-foundation.org,
	Will Deacon <will@kernel.org>
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

On Fri, Sep 06, 2019 at 05:15:38PM +0200, Arnd Bergmann wrote:
>  drivers/iommu/omap-iommu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Applied, thanks Arnd.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
