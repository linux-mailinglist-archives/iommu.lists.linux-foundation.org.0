Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 7362D61DFA
	for <lists.iommu@lfdr.de>; Mon,  8 Jul 2019 13:54:04 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 5F23C24D2;
	Mon,  8 Jul 2019 11:53:58 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B83092468
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 11:46:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 6C315898
	for <iommu@lists.linux-foundation.org>;
	Mon,  8 Jul 2019 11:46:32 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id h28so7981993vsl.12
	for <iommu@lists.linux-foundation.org>;
	Mon, 08 Jul 2019 04:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=R2ZdY3vnEp0/xxIG9ODcbL1P9vx2puRdU7JsuqsdsDE=;
	b=lOuDWrVlmU37BJpmIdi5RO/Gmtkght9XnLNIHFt4VfvVfB85rutsfvBlEEBA90kBrk
	u70O+fr8GhG0CgxszBykj2/yiSbIqJCp0/L2i2/A3IktViPEA7RkHOvG6dAzlVheB+yT
	FEYdveLceIA42kJWkicK26TivzVUu9pvBMeoH471i7ECnJ8ndMF6Qb9sTo4KHw8ziwU4
	3IilPOvwiloO1NR/U/DvitYhtppqAbmPjVkvorKXhzUTEJKqhpzy1hFWz5cgPooUXrSs
	OVeaJ/rIVJc1Eiuoxj/gwewyiQ3rbLfsBRg9VQjWazy+XR24Crj3d6W8I6Kd7PExdRPQ
	7t8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=R2ZdY3vnEp0/xxIG9ODcbL1P9vx2puRdU7JsuqsdsDE=;
	b=O+KwXzJr8TQZFjMv9YryiPzQzd9PwSjx9A6VFRS6yBhXaHpNhZMP7OfBUyL5gjcxck
	Co3DBzF4qQVh5Arifm2+TycPKBYvaLv1CFzBw/Z+p+S13CZkn9K/Ty4Lv5aGexViodPr
	snd/2RjB2mSTIkXaNuMExT+UY/b3/UDWjyfKK0kaeTV51Ko7nLlbt7O9ENwk35kaEj1r
	AJA+gOLoGPkpp3F0kYQHFhN6FniYUY6pgtlLbMchcQFeEbwQnPmaBm9Iy8QIPKSrfgtF
	ItPMYl6qkRFd8g6eavEh0aAxciU3lhDBM0nyASVH2UpcPjVnZxXBqmEhCWfC/W1jIxG0
	WX1Q==
X-Gm-Message-State: APjAAAXMTM73fGmrQoJjL1YX+vWe5BSUxKoK9GDizfFDgf3LiGU+qRC1
	SWjhsq7zw8R7qFriujL/YnU5oVKney3NFp/SB53aPw==
X-Google-Smtp-Source: APXvYqz/0AeZ3lpWjyWdDtbRymPqi8GXkj3SOZMAZXHn0JyhhB2oxU3RiSdU8S5bXxz39obVN9uEBxKyU4CHxLWaA00=
X-Received: by 2002:a67:ee5b:: with SMTP id g27mr9861928vsp.165.1562586391357; 
	Mon, 08 Jul 2019 04:46:31 -0700 (PDT)
MIME-Version: 1.0
References: <1561020610-953-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
	<20190701083253.GA22719@lst.de>
In-Reply-To: <20190701083253.GA22719@lst.de>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 8 Jul 2019 13:45:55 +0200
Message-ID: <CAPDyKFpg6zMRtnD89juuXR8Epas7qJOo8GgdTR=Q1kbZ0=69LA@mail.gmail.com>
Subject: Re: [RFC PATCH v7 0/5] treewide: improve R-Car SDHI performance
To: Christoph Hellwig <hch@lst.de>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Jens Axboe <axboe@kernel.dk>, linux-block <linux-block@vger.kernel.org>,
	"linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	Robin Murphy <robin.murphy@arm.com>
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

On Mon, 1 Jul 2019 at 10:32, Christoph Hellwig <hch@lst.de> wrote:
>
> Any comments from the block, iommu and mmc maintainers?  I'd be happy
> to queue this up in the dma-mapping tree, but I'll need some ACKs
> for that fast.  Alternatively I can just queue up the DMA API bits,
> leaving the rest for the next merge window, but would drag things
> out far too long IMHO.

Apologize for the delay, the mmc parts looks good to me. If not too
late, feel free to pick it up.

Otherwise, let's do it for the next cycle.

Kind regards
Uffe
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
