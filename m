Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 59F00713C2
	for <lists.iommu@lfdr.de>; Tue, 23 Jul 2019 10:17:46 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2456AB6C;
	Tue, 23 Jul 2019 08:17:44 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 152DA2C
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 08:17:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from theia.8bytes.org (8bytes.org [81.169.241.247])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6DB2CFE
	for <iommu@lists.linux-foundation.org>;
	Tue, 23 Jul 2019 08:17:42 +0000 (UTC)
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 5F4E43A2; Tue, 23 Jul 2019 10:17:40 +0200 (CEST)
Date: Tue, 23 Jul 2019 10:17:35 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Dmitry Safonov <dima@arista.com>
Subject: Re: [PATCH 1/2] iommu/vt-d: Don't queue_iova() if there is no flush
	queue
Message-ID: <20190723081735.GJ12009@8bytes.org>
References: <20190716213806.20456-1-dima@arista.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190716213806.20456-1-dima@arista.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Dmitry Safonov <0x7f454c46@gmail.com>, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, iommu@lists.linux-foundation.org,
	David Woodhouse <dwmw2@infradead.org>
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

On Tue, Jul 16, 2019 at 10:38:05PM +0100, Dmitry Safonov wrote:

> @@ -235,6 +236,11 @@ static inline void init_iova_domain(struct iova_domain *iovad,
>  {
>  }
>  
> +bool has_iova_flush_queue(struct iova_domain *iovad)
> +{
> +	return false;
> +}
> +

This needs to be 'static inline', I queued a patch on-top of my fixes
branch.

Regards,

	Joerg
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
