Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6ACE84A1
	for <lists.iommu@lfdr.de>; Tue, 29 Oct 2019 10:43:44 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1B38D13EB;
	Tue, 29 Oct 2019 09:43:40 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 31198ACD
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 09:43:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f49.google.com (mail-io1-f49.google.com
	[209.85.166.49])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CDDCF42D
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 09:43:38 +0000 (UTC)
Received: by mail-io1-f49.google.com with SMTP id q1so14051413ion.1
	for <iommu@lists.linux-foundation.org>;
	Tue, 29 Oct 2019 02:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=1l9+Oi2LefksR/ikLAzJ85I8QnbO6rgm6iDo/745RlQ=;
	b=ttSuo76B6fOIo4fYBg/lIl9g49+0/s0yZw9IDaZdxhDkCMw2QZTZrMJqU24o2Y5JeT
	6GrnANl8GmMThDc4kT8AEVZH4OESFxU/if4zRfyraHccuYLX7Rjsb7uTdsCeuTOyPqra
	ho5AetxWR/Gu1QgFNArvUcVfvjee5U7gscwhaIQifN4Z57mUwfB3txpgFXzrWECs6HnQ
	TUL8MbTqg4Q7Q85XLby+DW8avgZLywxQ8nI+zW/wxnH5chsJdmwkbocUKd3CU+CLmV2Q
	QDmngFXaxcK21vGhRYyvW9RSL/YLjDe3DsRkNm3C9ZGDAdyLJJAmFNSZQBgGkG/IKl02
	2Giw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=1l9+Oi2LefksR/ikLAzJ85I8QnbO6rgm6iDo/745RlQ=;
	b=JcdAmuBHaG57cU517UWTHd3/5rZ2r4AjkkS0xgnm9UNYhH2phSZn30/9dloM6lcwkW
	2s1csEoIi29j+IE75lEDJcdpdh/JTHHSXRZ6MYDf+xdGxbMF7fMV/kOt5C2YbtDaxw77
	2bXtGw61SIZsYR0Rf8G5w1wSFe/aoN/GMfA5WSf14toD0fKdGuNTvNI92oiyVzZ6xTCR
	iC44R6amYaJWbdpePsQcLaOXBl9pbYqzBcvlVv5k7guSMwDmAZXca96npZx8lDXkcbrG
	0O4Mf0jiSRfPFhNd+2N+4hHlhNIMxvqShVATI6eh3GOYixgcMyJ66ChbugWXcdz7jjaf
	805A==
X-Gm-Message-State: APjAAAVu+Wnz/bm/4KCbf8Uy7PFC5W7R6td7Qjnc4TGhkm51PuKDzq2f
	fxvbuTrHgYWejHlaXNhe2xpwTjq17wn+z4/OGbw=
X-Google-Smtp-Source: APXvYqytKiG8+DL8umM3ThNlj9xVKImL+vHYbecbgzcla15T2fJAUvpid4icFm0yEQ5ardwzKiPK59oux6jwZF5t+ng=
X-Received: by 2002:a6b:b886:: with SMTP id i128mr2683870iof.229.1572342218007;
	Tue, 29 Oct 2019 02:43:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAA2QUqLv+eLXuA_TdJ7zM4oBnGoFVOjRjAimuct2y=0MDuaZVQ@mail.gmail.com>
	<d983cf57-f13d-a680-21c4-09b5ca93bc64@arm.com>
	<acf0dd2c-7e12-fba6-b7f8-dfd78c892fe5@arm.com>
	<417fa080-08f9-9f35-687b-c0b82a61628d@arm.com>
	<376133e3-25f2-ffe7-ef9f-4613388b2bf7@arm.com>
	<84747008-85e9-e71a-b9ad-cefcc6c0f661@st.com>
	<3305c91e-e630-b7fd-4c6f-598583504d67@arm.com>
	<6b024e69-f612-6850-8a04-9b3049549092@st.com>
	<2153b504-8c98-6c43-6ae3-9fb355d88417@arm.com>
In-Reply-To: <2153b504-8c98-6c43-6ae3-9fb355d88417@arm.com>
From: Daniele Alessandrelli <daniele.alessandrelli@gmail.com>
Date: Tue, 29 Oct 2019 09:43:26 +0000
Message-ID: <CAA2QUqJcJuhnAEOirNYdM4W_+sskO=CvLB9R7PpCPg-hsBLBJQ@mail.gmail.com>
Subject: Re: [BUG] dma-ranges, reserved memory regions, dma_alloc_coherent:
	possible bug?
To: Vladimir Murzin <vladimir.murzin@arm.com>
X-Spam-Status: No, score=0.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, DOS_RCVD_IP_TWICE_B, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=no version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Alexandre Torgue <alexandre.torgue@st.com>, Arnd Bergmann <arnd@arndb.de>,
	iommu@lists.linux-foundation.org, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>
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

On Mon, Oct 28, 2019 at 10:59 AM Vladimir Murzin
<vladimir.murzin@arm.com> wrote:
>
> @Daniele, it'd be handy to know if that fix issue for you...
>

Apologies, I've been traveling for the last few days and haven't
managed to try it yet.

I'll do it later today though and let you know.

Regards,
Daniele
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
