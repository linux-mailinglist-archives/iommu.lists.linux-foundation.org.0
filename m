Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id B4A0C13476
	for <lists.iommu@lfdr.de>; Fri,  3 May 2019 22:39:50 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 326483D1F;
	Fri,  3 May 2019 20:39:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DAB053D1C
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 20:38:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
	[209.85.160.176])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4190579
	for <iommu@lists.linux-foundation.org>;
	Fri,  3 May 2019 20:38:53 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id d13so8289402qth.5
	for <iommu@lists.linux-foundation.org>;
	Fri, 03 May 2019 13:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lca.pw; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=8tPVzyCxevz7vaRRVLlXkojOrnYFDky2SPWQCyXh6gU=;
	b=a3XgxIYysWPc+FKMoGx5n77e17z5A4FMicm3QGWq3xjBavCSL1JHFd85wIDXzfLuBH
	O7nQ7tq/1uXTTssayyLdOS5GOHmlmlYZdRPmbNeFfYuSLB+8Welisfdrj8HiKryNWj7B
	3qjreLTmdkndMxaau6B/9GcSyphKYdAU79ibyUDM/Kpm6pmU80ygIvAN1t5axlToP3OJ
	35LYp/Njg8r36vpKiFdM7JfJlSObpM5E8Q+/satWf+ax2HcSTWoRfGUcb7M7TUdD8Bwe
	/jPqO6FI/K4Ei5jEZtKnGNzskiMWoozXIEGukaxZpEjS9Wi5FLqFKfMzX60jCk3PpfMU
	2qTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=8tPVzyCxevz7vaRRVLlXkojOrnYFDky2SPWQCyXh6gU=;
	b=aem0qo7MhUqEDbUD+Anhm9632uRl1dH650HF2I4clwNZOtoDnRPfY6Ai0v1lO6nKrO
	sao+0IaIgvNsSR7aDLWHyYW1lgrwTmWXrAd9Z5AAH3uT3WdOeJukEBvWPJEYyFB5mV+s
	dMdP4l37sUZ2y+71y/ygnjsKnywYuEhxWLa4I8IEGmF+6gqGfAG6cPz0O3tpcJz7G29R
	3b6Mmmcq76Is+h//vf2zVxgPy553EvyRKQj4WKVT3UgLhRDzNIdE5ijgGpcMI7HmQgvW
	XHOx8Rj2aE2s+Cl8fm4snx5qkc5ATMR6zI6YP8YCz0Fr9FlKCV9XezXQvamUORkJr4nf
	uRJg==
X-Gm-Message-State: APjAAAV/D6JZhrKe7h7XF0UgssXpX+DghQwoEOCDnodMmgffv7b5WKzt
	Kasq40mYqUT9keZQIm/MVmyUAw==
X-Google-Smtp-Source: APXvYqygYpFaSjaM6wxI+nnmZguKF7zaKCDNH9I92+y5gfIS3DPW0JLU1WkfEzNGOFrd46iUbfkPLQ==
X-Received: by 2002:a0c:994a:: with SMTP id i10mr8618712qvd.48.1556915932314; 
	Fri, 03 May 2019 13:38:52 -0700 (PDT)
Received: from dhcp-41-57.bos.redhat.com (nat-pool-bos-t.redhat.com.
	[66.187.233.206])
	by smtp.gmail.com with ESMTPSA id 46sm2028708qto.57.2019.05.03.13.38.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 03 May 2019 13:38:51 -0700 (PDT)
Message-ID: <1556915930.6132.16.camel@lca.pw>
Subject: Re: "iommu/amd: Set exclusion range correctly" causes smartpqi offline
From: Qian Cai <cai@lca.pw>
To: Joerg Roedel <jroedel@suse.de>
Date: Fri, 03 May 2019 16:38:50 -0400
In-Reply-To: <20190429142326.GA4678@suse.de>
References: <1556290348.6132.6.camel@lca.pw> <20190426152632.GC3173@suse.de>
	<1556294112.6132.7.camel@lca.pw> <20190429142326.GA4678@suse.de>
X-Mailer: Evolution 3.22.6 (3.22.6-10.el7) 
Mime-Version: 1.0
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
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

On Mon, 2019-04-29 at 16:23 +0200, Joerg Roedel wrote:
> On Fri, Apr 26, 2019 at 11:55:12AM -0400, Qian Cai wrote:
> > https://git.sr.ht/~cai/linux-debug/blob/master/dmesg
> 
> Thanks, I can't see any definitions for unity ranges or exclusion ranges
> in the IVRS table dump, which makes it even more weird.
> 
> Can you please send me the output of
> 
> 	for f in `ls -1 /sys/kernel/iommu_groups/*/reserved_regions`; do echo "-
> --$f"; cat $f;done
> 
> to double-check?

https://git.sr.ht/~cai/linux-debug/blob/master/iommu
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
