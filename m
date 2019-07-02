Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAD5D7C4
	for <lists.iommu@lfdr.de>; Tue,  2 Jul 2019 23:08:29 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2DFE921BD;
	Tue,  2 Jul 2019 21:08:25 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5BF6A1996
	for <iommu@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 21:03:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pg1-f196.google.com (mail-pg1-f196.google.com
	[209.85.215.196])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id D0707834
	for <iommu@lists.linux-foundation.org>;
	Tue,  2 Jul 2019 21:03:38 +0000 (UTC)
Received: by mail-pg1-f196.google.com with SMTP id t132so4916642pgb.9
	for <iommu@lists.linux-foundation.org>;
	Tue, 02 Jul 2019 14:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=+v++TWQepjq+jXcnB/nkSYABP3Yxzhi+VRnwYA7APOc=;
	b=oMb6uM8LX67HBBPGSfb9AUp3WO62ALREH93oGjCh6lO/52vJU14Whlz5WJTyiSSMrz
	QjaNY/UQ071B1xHmQllCQ6rr7wCt6LfkVksGvNso68NLioyZLq/CiWF91YNHV3RVc4Tc
	uKYaHgTqS5g77nWbSFqqtkguGecdLARTlgXwiQcCjSJGW9dNVfB5jAyGp9efviyHfv41
	FmHQ7ktOdAJy57+EuNl5e0YYpeK5FnzK6KngtCHCVJSKMDnCICS8DqhxsQDvRx7ecso7
	kROKNQpbpmweFl+TG+cpIQMjO6gH1SGadjtzkB71XIJpb8QrwIg9DBSqOmSvj1+gYjtW
	PIVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=+v++TWQepjq+jXcnB/nkSYABP3Yxzhi+VRnwYA7APOc=;
	b=Nz9U7OtmPEKK8wWuXcbm9RwmZBWjYKI9W87ykGX7F+EebuUYPCCn7wh88zebUQrLfA
	LiqYwNKd19nwokSBsfpedwQjFkkGdajm89VVKQ95G4Tq2GwotEWo+l4pjwDoQdvfcDQF
	t19Q8yFOSyK6nIl+r62bzcekAVNpvwcOs+5UHD297KEfl4q6yw3nfDUecnJp9Com9TJ9
	dwPzOtzFAVIwOZt6ml3YGkyqTB+zGkb1mgz41CzWpiuS9R8kh7jGwNpO8kgnd6bIPpf5
	wIxdxRgFSWVFMRjlI755vKZJZvRJnvziKZ1234hYP77QfAutSAwFSszvmyTxzAAPZoag
	m+HA==
X-Gm-Message-State: APjAAAV1EtPYS0ANQLCtYF4pJvxMmQJcIaW7Y2jrp0t+QdSW+SM3pYoV
	rlka0l6pNmJW2r3tlZXNIPnc7fGIc/s=
X-Google-Smtp-Source: APXvYqx+HGwW+nz/+iPgIThxonkUBijVnsTKXtGANv3oqK0FIvnCQgiB8iPHGgSMuIFGhcqm4pEVDQ==
X-Received: by 2002:a17:90a:26ea:: with SMTP id
	m97mr7877414pje.59.1562101418200; 
	Tue, 02 Jul 2019 14:03:38 -0700 (PDT)
Received: from Asurada-Nvidia.nvidia.com (thunderhill.nvidia.com.
	[216.228.112.22]) by smtp.gmail.com with ESMTPSA id
	q126sm21796589pfq.123.2019.07.02.14.03.36
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 02 Jul 2019 14:03:37 -0700 (PDT)
Date: Tue, 2 Jul 2019 14:04:01 -0700
From: Nicolin Chen <nicoleotsuka@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH] iommu/dma: Fix calculation overflow in __finalise_sg()
Message-ID: <20190702210400.GA14593@Asurada-Nvidia.nvidia.com>
References: <20190622043814.5003-1-nicoleotsuka@gmail.com>
	<20190701122158.GE8166@8bytes.org>
	<91a389be-fd76-c87f-7613-8cc972b69685@arm.com>
	<20190701215016.GA16247@Asurada-Nvidia.nvidia.com>
	<d4bccb17-2f7a-65e4-6c89-e37cceb6d935@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d4bccb17-2f7a-65e4-6c89-e37cceb6d935@arm.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org
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

On Tue, Jul 02, 2019 at 11:40:02AM +0100, Robin Murphy wrote:
> On reflection, I don't really think that size_t fits here anyway, since
> all the members of the incoming struct scatterlist are unsigned int too.
> Does the patch below work?

Yes.

> ----->8-----
> From: Robin Murphy <robin.murphy@arm.com>
> Subject: [PATCH] iommu/dma: Handle SG length overflow better
> 
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
> 
> Fixes: 809eac54cdd6 ("iommu/dma: Implement scatterlist segment merging")
> Reported-by: Nicolin Chen <nicoleotsuka@gmail.com>
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>

Tested-by: Nicolin Chen <nicoleotsuka@gmail.com>

Thank you!

> ---
>  drivers/iommu/dma-iommu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 129c4badf9ae..8de6cf623362 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -721,7 +721,7 @@ static int __finalise_sg(struct device *dev, struct scatterlist *sg, int nents,
>  		 * - and wouldn't make the resulting output segment too long
>  		 */
>  		if (cur_len && !s_iova_off && (dma_addr & seg_mask) &&
> -		    (cur_len + s_length <= max_len)) {
> +		    (max_len - cur_len >= s_length)) {
>  			/* ...then concatenate it with the previous one */
>  			cur_len += s_length;
>  		} else {
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
