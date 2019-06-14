Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 85AA1465E0
	for <lists.iommu@lfdr.de>; Fri, 14 Jun 2019 19:39:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 577A7137D;
	Fri, 14 Jun 2019 17:39:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DB7EA1167
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 17:39:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f67.google.com (mail-io1-f67.google.com
	[209.85.166.67])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 81A4AE5
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 17:39:52 +0000 (UTC)
Received: by mail-io1-f67.google.com with SMTP id k8so7631149iot.1
	for <iommu@lists.linux-foundation.org>;
	Fri, 14 Jun 2019 10:39:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pyNZh3/ZiJGCHGyK6bSxYhhEMHeQph+kYYlr649t5fI=;
	b=fnFmAH1S+PAJamnF3NqeGjNJKLKabKSrwIeQ4EWJOLeaxDi+l9iEip4OJmJBE4s4L5
	t9EWMjkoX75msS90FvzStnVp/1AD3CIo70/WhRleVWjKXaqS3APRMAJECm+XcYadU/ix
	NoYetrWGQsDpipp5CJSmFksF4KKmbPS+G5fi+ZUtKbo2GXH7BN59YlDslJywgc2SS+gy
	7nSTV2khtyZxk64W+L6RLIHRhrh19JY6SbxYGhrM4ZCTDfu5g2mtLUyNnQtuaUcGndFD
	fG4rYx3xyR8Rc02ZTzSUJSrO3nLpuK/4ZfzmIZPbx6Ud+dlFALl7B/IX0ZD07hvzgrFQ
	PnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pyNZh3/ZiJGCHGyK6bSxYhhEMHeQph+kYYlr649t5fI=;
	b=aQALVc35opn7hEcDLMnCRK9BnClrkvmR8Vx/noffXMy3OzD2eLJMRaNT78ksKoeBDz
	TzMIN91KNHiRF5Xf7YBa2H8enufyVvMbSbdlCPf1+cYMJmjBz3EY1PyGNlBfJC1bUIBZ
	XaW+BsvVI8hRM2258prtWIzI4PHIObFwgL8zkhz0QRY7VAyeB/F/WzNigBs7cKk2aKM+
	ol63r6PLp6C/QKJr5FakWvi+1qcT6u8P3dv+lQr6z8AXD3AjuJozGWpzvcpyJtBsx6N3
	xeM7T94AMGgyxNqfWvBVoeroEJjrMM8D6S+XKacCqAkPs+/FjD+TdiaG0ayL31qyoJhI
	sCWQ==
X-Gm-Message-State: APjAAAUotyk8b6880ncsLEKeNdUArqv0T3VO1dkJrHO8joZk4m0e6Wof
	ZhYBkkHHKSUmqL7yqRab23KxfrdQarTzTnVV8PY=
X-Google-Smtp-Source: APXvYqwNZ0eXs3p92pVUhwtqOL0humBUMj2IEaTDc3AAW0U+hb04I4VnHxh86HS27ouhORHP6iTBY8v4nEVPMWiA21c=
X-Received: by 2002:a02:9567:: with SMTP id y94mr69763782jah.28.1560533991898; 
	Fri, 14 Jun 2019 10:39:51 -0700 (PDT)
MIME-Version: 1.0
References: <20190613162703.986-1-tiny.windzz@gmail.com>
	<20190614071245.GA2950@infradead.org>
In-Reply-To: <20190614071245.GA2950@infradead.org>
From: Frank Lee <tiny.windzz@gmail.com>
Date: Sat, 15 Jun 2019 01:39:40 +0800
Message-ID: <CAEExFWupzjErW1E0z3tcR2xyGgpWXwgLZOTqvru4=hk98EfGhQ@mail.gmail.com>
Subject: Re: [PATCH 01/10] iommu/exynos: convert to SPDX license tags
To: tglx@linutronix.de
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: linux-samsung-soc@vger.kernel.org,
	=?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org, will.deacon@arm.com,
	agross@kernel.org, krzk@kernel.org, jonathanh@nvidia.com,
	David Brown <david.brown@linaro.org>, kgene@kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
	robin.murphy@arm.com,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
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

Need me to make them a patch?

MBR,
Yangtao
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
