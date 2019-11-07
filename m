Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FE1F3A83
	for <lists.iommu@lfdr.de>; Thu,  7 Nov 2019 22:27:56 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2C157EF5;
	Thu,  7 Nov 2019 21:27:53 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 46D6ADB3
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 21:27:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
	[209.85.166.66])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id E9A8F196
	for <iommu@lists.linux-foundation.org>;
	Thu,  7 Nov 2019 21:27:51 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id k1so3970534ioj.6
	for <iommu@lists.linux-foundation.org>;
	Thu, 07 Nov 2019 13:27:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eK6q6zrwrUz/2YQcdvxZ3HcYVjvB9LVJa0VW9PrlQgw=;
	b=aMxarZDMn8/+ZTwLmr9xiJrCEyYnzUCeulkISZ+VWIkgM2+Tvg/SIBgLvqCdvgYaro
	7TWwstCis8HR1f+02LH8TxqFrrnfPmbocmfts3bNK6vn+paq2D6upM3h2Dh8ESWimLfR
	7KDp2SG/mmMF+UO1dGo2RVWC0kCR+t0kBzEWplgAndmgir7SdBPEgg+suEYnDu/q2+9R
	Fxour4E/NUcSYDTcC8UOg8KfyYNM792kAl1V5PMVpJpul8vApR8iDeS3A864PM5hz26l
	ceuQ/OlYDJHb0383d+9hMlyudwSg14ciUZ763g7KhMhGHDfIGmhgqb6gfJ22vYJaSefe
	BYfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eK6q6zrwrUz/2YQcdvxZ3HcYVjvB9LVJa0VW9PrlQgw=;
	b=e7rO2sA2+m5tKVxdQT+yJ1v5NK06NAZ+LPwg/N+7LmBQzhKHnVZM8qUf4DGhH3VrF+
	W6MzLDn7FZL09lUmp4YmocFLP/12Hi4+kpi0tmJkHWlsUgNC0Tz2u4THOeS8zXkPpKdy
	b8oPpp/22yzlUXQCfibpHtj2f9UlcyWVxiWhNjJ9YnTOBFl9C5CpqXwB0YzlwM6398Li
	+OxcOyWGvgbMFY4lb1uYhnEpswXXjYa5WNTcNf5IPErl1rMRIquz4ag2u2GQx5BybWJS
	eXNyq5icV31/1k2UglVtdlDbqWJBsgUVJ4BDj233hYwGw8cATyws0GxV4Yn541EsX2jG
	NeGQ==
X-Gm-Message-State: APjAAAVwKxwRb/i7s7GBz2v3Gw3pPZmQFFRJ9PWfRp0YDfP3OopFQDAO
	C7Cea0afhInhyT/bNgAJggE80/In7VW89ZxezKI=
X-Google-Smtp-Source: APXvYqwVNe1X+M1QlsTXNL6HXP3xspn+6r9ttBYU8x8guIj6e4OBIfBd4K2Rxf8NXF5PTW22eei0bYBqCz+ztKWoy7s=
X-Received: by 2002:a6b:e403:: with SMTP id u3mr6358356iog.130.1573162070942; 
	Thu, 07 Nov 2019 13:27:50 -0800 (PST)
MIME-Version: 1.0
References: <20191107205914.10611-1-deepa.kernel@gmail.com>
In-Reply-To: <20191107205914.10611-1-deepa.kernel@gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Thu, 7 Nov 2019 13:27:35 -0800
Message-ID: <CABeXuvpYE9FCdX-FXTEg-rN_dtoxVn5+2psgU_AxPUPk38fQEw@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: Turn off translations at shutdown
To: joro@8bytes.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: iommu@lists.linux-foundation.org, David Woodhouse <dwmw2@infradead.org>
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

On Thu, Nov 7, 2019 at 12:59 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
> +static void intel_iommu_shutdown(void)
> +       if (no_iommu || dmar_disabled)
> +               return;

This check is actually not required here, as the handler is only
installed after these have been checked in intel_iommu_init.
I can remove this in the next version of the patch, but I'll wait a
few days for comments.

-Deepa
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
