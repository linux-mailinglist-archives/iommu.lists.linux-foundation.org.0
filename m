Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D6E2CA2E0
	for <lists.iommu@lfdr.de>; Thu,  3 Oct 2019 18:11:24 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id ACBF51014;
	Thu,  3 Oct 2019 16:11:20 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 734FFFCD
	for <iommu@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 16:11:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 0829A19B
	for <iommu@lists.linux-foundation.org>;
	Thu,  3 Oct 2019 16:11:18 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id q7so2058397pfh.8
	for <iommu@lists.linux-foundation.org>;
	Thu, 03 Oct 2019 09:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
	h=message-id:mime-version:content-transfer-encoding:in-reply-to
	:references:from:to:cc:subject:user-agent:date;
	bh=WCl0BJ/xg5z2POfrHRFKcHi5xkDivkEW/iGK30/2GP0=;
	b=Pq/jSr1xmzlqjDuxBQh7dFDV5hRyr6MZtXVubXctjAF8kRjt+U6xL1O1zUsbiV9qug
	ygNsoBsTe8l9J4vQh++/GIEgBZ3tc+dCBa+tnW6tuf4O22v4fqwHlcvMDTQXutYl4bj7
	bWJISwhs7L3e2klQ4E9mPH1vemoDoOFTbhMxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:mime-version
	:content-transfer-encoding:in-reply-to:references:from:to:cc:subject
	:user-agent:date;
	bh=WCl0BJ/xg5z2POfrHRFKcHi5xkDivkEW/iGK30/2GP0=;
	b=OUN8agJ3l706MSE4Xeplcq0YgarGqGyp8xQmGuIbhdYG57CJ9O3MD+WE/NRZwID2nV
	LR0UjoafSRi/2/LG25P95pmYNHnWYaCZWNFbdMqSB+FSsqY+cnhZW6M6CJ6ypAbKbhHK
	mXpGCq3+QIlRzJCF9RrNxNVg1+cX7Er49fe5vxE5qKYXQ23Pvh90YvLLv4C2IrzCxTxS
	LxcDYfNb/FAdPByxXK8Q7LzX3EnjI9pIqu2U1h97KwbFy+Lpwel4izWm3nYl7DOYjJ38
	Y4z+RljmmE93nWMxHHXnMNClaPkBDDxd+D7XLbQn7WTrI+8RXNlY1bWD1QC8FLSTorUU
	drVA==
X-Gm-Message-State: APjAAAUMysS1dgPCuaGoHswjQRAwz/x1lcwhShAdcrrg4Tzhdx+yMqFm
	4F8QuV3z95MIERJQpeLrkwEl3Q==
X-Google-Smtp-Source: APXvYqwgRSbE1eF4YKGVz+xu6rX+ntZRdmjPXT4BO1EQpfB2LWEVRFrJK7RpkgO+T9w/1Sx9rAIAHg==
X-Received: by 2002:a17:90a:ba94:: with SMTP id
	t20mr11602435pjr.8.1570119078443; 
	Thu, 03 Oct 2019 09:11:18 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
	by smtp.gmail.com with ESMTPSA id
	j25sm4527578pfi.113.2019.10.03.09.11.17
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 03 Oct 2019 09:11:17 -0700 (PDT)
Message-ID: <5d961da5.1c69fb81.f4dce.d93e@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <20191001180622.806-1-geert+renesas@glider.be>
References: <20191001180622.806-1-geert+renesas@glider.be>
From: Stephen Boyd <swboyd@chromium.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Joerg Roedel <joro@8bytes.org>
Subject: Re: [PATCH] iommu/ipmmu-vmsa: Only call platform_get_irq() when
	interrupt is mandatory
User-Agent: alot/0.8.1
Date: Thu, 03 Oct 2019 09:11:17 -0700
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-renesas-soc@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
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

Quoting Geert Uytterhoeven (2019-10-01 11:06:22)
> As platform_get_irq() now prints an error when the interrupt does not
> exist, calling it gratuitously causes scary messages like:
> 
>     ipmmu-vmsa e6740000.mmu: IRQ index 0 not found
> 
> Fix this by moving the call to platform_get_irq() down, where the
> existence of the interrupt is mandatory.
> 
> Fixes: 7723f4c5ecdb8d83 ("driver core: platform: Add an error message to platform_get_irq*()")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
