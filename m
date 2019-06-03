Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 81AD83309A
	for <lists.iommu@lfdr.de>; Mon,  3 Jun 2019 15:07:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A7D12DD6;
	Mon,  3 Jun 2019 13:07:42 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 451E7DC1
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 13:07:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from foss.arm.com (usa-sjc-mx-foss1.foss.arm.com [217.140.101.70])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E246083A
	for <iommu@lists.linux-foundation.org>;
	Mon,  3 Jun 2019 13:07:40 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 885F815A2;
	Mon,  3 Jun 2019 06:07:40 -0700 (PDT)
Received: from [10.1.196.75] (e110467-lin.cambridge.arm.com [10.1.196.75])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 995BC3F5AF;
	Mon,  3 Jun 2019 06:07:39 -0700 (PDT)
Subject: Re: [PATCH] iommu: replace single-char identifiers in macros
To: Qian Cai <cai@lca.pw>, jroedel@suse.de
References: <1559566783-13627-1-git-send-email-cai@lca.pw>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <fe5e8da4-38d2-c663-c2e2-70e6d4f7640f@arm.com>
Date: Mon, 3 Jun 2019 14:07:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <1559566783-13627-1-git-send-email-cai@lca.pw>
Content-Language: en-GB
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: akpm@linux-foundation.org, iommu@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: iommu-bounces@lists.linux-foundation.org
Errors-To: iommu-bounces@lists.linux-foundation.org

On 03/06/2019 13:59, Qian Cai wrote:
> There are a few macros in IOMMU have single-char identifiers make the
> code hard to read and debug. Replace them with meaningful names.
> 
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Qian Cai <cai@lca.pw>
> ---
>   include/linux/dmar.h | 14 ++++++++------
>   1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/dmar.h b/include/linux/dmar.h
> index f8af1d770520..eb634912f475 100644
> --- a/include/linux/dmar.h
> +++ b/include/linux/dmar.h
> @@ -104,12 +104,14 @@ static inline bool dmar_rcu_check(void)
>   
>   #define	dmar_rcu_dereference(p)	rcu_dereference_check((p), dmar_rcu_check())
>   
> -#define	for_each_dev_scope(a, c, p, d)	\
> -	for ((p) = 0; ((d) = (p) < (c) ? dmar_rcu_dereference((a)[(p)].dev) : \
> -			NULL, (p) < (c)); (p)++)
> -
> -#define	for_each_active_dev_scope(a, c, p, d)	\
> -	for_each_dev_scope((a), (c), (p), (d))	if (!(d)) { continue; } else
> +#define for_each_dev_scope(devs, cnt, i, tmp)				\
> +	for ((i) = 0; ((tmp) = (i) < (cnt) ?				\

Given that "tmp" actually appears to be some sort of device cursor, I'm 
not sure that that naming really achieves the stated goal of clarity :/

Robin.

> +	    dmar_rcu_dereference((devs)[(i)].dev) : NULL, (i) < (cnt)); \
> +	    (i)++)
> +
> +#define for_each_active_dev_scope(devs, cnt, i, tmp)			\
> +	for_each_dev_scope((devs), (cnt), (i), (tmp))			\
> +		if (!(tmp)) { continue; } else
>   
>   extern int dmar_table_init(void);
>   extern int dmar_dev_scope_init(void);
> 
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
