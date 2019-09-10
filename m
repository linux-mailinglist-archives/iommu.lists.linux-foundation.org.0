Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4A3AEE90
	for <lists.iommu@lfdr.de>; Tue, 10 Sep 2019 17:34:31 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id A27F2D8B;
	Tue, 10 Sep 2019 15:34:29 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 7D547CA6
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 15:34:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 4CAB581A
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 15:34:26 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id c19so17491052edy.10
	for <iommu@lists.linux-foundation.org>;
	Tue, 10 Sep 2019 08:34:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=b4wnBlpeFgpGxUVqzfbdvP1S+Q+RawN3p7bTgqnZia8=;
	b=tzUouiroRdJjO/r28/634yrQ4C8pWz/+BOZ+mEtUOK3kpyHqIRhDkUnyEQ71dGDzZd
	eV9r1PRFyP8IHgUbl9FqShjbwycRxAB0fwLv2qC7bme4DyOSOsM8HR2u8x2sI4UPumtG
	c0OlWiSyl2uwiL7uTXcNcWtQwoZ4hvX3jgw3VhaUOJjf3FlZgjIN68zIQso9eaGkmtTP
	/3GmXxjh0Fn7jkEanuaNrTfCjI+I3RqMMoKmq7qrrJjrlZg7YmxLdzpWZA4BjA4ivqxL
	s83bDaQOuAHvVXsmXCo9hHqsCcSA1CafKyd4S0M5LZYrxfey+98rQGYF5KXA6PmW3vyX
	foKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=b4wnBlpeFgpGxUVqzfbdvP1S+Q+RawN3p7bTgqnZia8=;
	b=L5fXMwlrMMmoq7X7Fn0bKRPZ2kr3dygNznzruOhZTPW1TIM5oaKpgYLbHLP1YX7I0V
	klshFDaUZ7VfxCLQ7VT4yHp+JMvg38D6o811BVyhRo68Py5BVrnqUYs485k01NtJlwjC
	M5n3ny+NU1rq/g+5Pzw84smsebWU3QVbZj8V6w6v0bFfVbKvElFHHBlp71tJmDGYriz8
	QNgYXnMd3BLt3H3CXJLUWHMwnmonxk06LfBRzxXw0nkzfyqpUqhy9yNMOVDVCO/MwBEQ
	d3W7GzJeFJLph+4GwuhiXE+5zdFAmtLMZIq/q8YS3pCpOjeubFAJFRrfbbuiuflneyb2
	mj0w==
X-Gm-Message-State: APjAAAU9WAYWFCcaEpE6/3kze+gHpA/Sz9ENNHYTciEztIrqxQRMh0OE
	1rO0tLfU35upHkwZ1f+wcPIUBxS8h9fM0XtPxgaZ8Td3qEM=
X-Google-Smtp-Source: APXvYqyyx6xWTkb16aLchOZtzOWws5iFVpGXm89mtst/lZo1kpZ1sLfKtvPombMjz1ZlKI1NrttKYsabF6z8hwrEYtQ=
X-Received: by 2002:a17:906:a3d5:: with SMTP id
	ca21mr25922239ejb.258.1568129664829; 
	Tue, 10 Sep 2019 08:34:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190906214409.26677-1-robdclark@gmail.com>
	<20190906214409.26677-2-robdclark@gmail.com>
	<20190910081415.GB3247@8bytes.org>
In-Reply-To: <20190910081415.GB3247@8bytes.org>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 10 Sep 2019 08:34:13 -0700
Message-ID: <CAF6AEGsFmuO5M_RWm-RjDT_F_1Z=MLYmNqRXqFNDR7aUoPaMdg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] iommu: add support for drivers that manage iommu
	explicitly
To: Joerg Roedel <joro@8bytes.org>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: Rob Clark <robdclark@chromium.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Suzuki K Poulose <suzuki.poulose@arm.com>,
	linux-arm-msm <linux-arm-msm@vger.kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Robin Murphy <robin.murphy@arm.com>,
	dri-devel <dri-devel@lists.freedesktop.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
	Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, Andrew Morton <akpm@linux-foundation.org>,
	Will Deacon <will@kernel.org>, open list <linux-kernel@vger.kernel.org>
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

On Tue, Sep 10, 2019 at 1:14 AM Joerg Roedel <joro@8bytes.org> wrote:
>
> On Fri, Sep 06, 2019 at 02:44:01PM -0700, Rob Clark wrote:
> > @@ -674,7 +674,7 @@ int iommu_group_add_device(struct iommu_group *group, struct device *dev)
> >
> >       mutex_lock(&group->mutex);
> >       list_add_tail(&device->list, &group->devices);
> > -     if (group->domain)
> > +     if (group->domain && !(dev->driver && dev->driver->driver_manages_iommu))
>
> Hmm, this code usually runs at enumeration time when no driver is
> attached to the device. Actually it would be pretty dangerous when this
> code runs while a driver is attached to the device. How does that change
> make things work for you?
>

I was seeing this get called via the path driver_probe_device() ->
platform_dma_configure() -> of_dma_configure() -> of_iommu_configure()
-> iommu_probe_device() -> ...

The only cases I was seeing where dev->driver is NULL where a few
places that drivers call of_dma_configure() on their own sub-devices.
But maybe there are some other paths that I did not notice?

BR,
-R
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
