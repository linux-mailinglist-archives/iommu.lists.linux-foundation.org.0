Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BA15F6AC0
	for <lists.iommu@lfdr.de>; Sun, 10 Nov 2019 19:24:37 +0100 (CET)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 1CD9B941;
	Sun, 10 Nov 2019 18:24:33 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 5E2D940B
	for <iommu@lists.linux-foundation.org>;
	Sun, 10 Nov 2019 18:24:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f65.google.com (mail-io1-f65.google.com
	[209.85.166.65])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id EC77212E
	for <iommu@lists.linux-foundation.org>;
	Sun, 10 Nov 2019 18:24:31 +0000 (UTC)
Received: by mail-io1-f65.google.com with SMTP id p6so11866386iod.7
	for <iommu@lists.linux-foundation.org>;
	Sun, 10 Nov 2019 10:24:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=SGPvkCQhS8lOGjJsjyLIOzETx5n0C33gWGyQBfpGz08=;
	b=EuRtfDui/jVwc7I7G2EAEIoN7CusJdRjXcOpzduQ1FCCd/wL4Oymv8SmWjUDLcJiJH
	XJ1k46LoLnQS8qLJ0rKKwFj9tQF5XncAcJFYalytPsokgB73l61dymH9ObiimWRgRALx
	/e4oe4PRzYLuM+duiVlB4IHgKYpypi1byIzNTSoe4skgCzcTo6yrayCURZUjLdX3tBxX
	eF55HKBhql/aCdebLp8rEskuX2uAB0vnXgGfPDMiZdxza1FmkMQBkNEXzmV7IbWHsgIG
	v1lE4Kaic2fjve2LS9kPgI04vEbB0LzPw8cCD9E2aEtylU+L+pME+mHNcGDIPXoomHuC
	dtYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=SGPvkCQhS8lOGjJsjyLIOzETx5n0C33gWGyQBfpGz08=;
	b=VL00frZWY4Pw2tJMf4wG5eRCBVDUkKGCGYQbbVTjbwavIsM0OA7qTwRJwA5HYohMFp
	ooRK0ALp0Y4Ar/p7rD9eEYkigMhOLM7c73Rgo6Wf9Vn7bIbnpbOmqfTFvTp5s01kRm47
	vj+Dpq6WONV4+r51nmURLfVeYZiUHJ/n1FSdZXQ1ix3VU4BKWY+pIhsFI7XbPKqi92qp
	kN8Feg2UlFxwRrLuu0YAEvVmCzpsRgk1Uc7NYRQvZ1+LVZF5n7wgZ8z14UfAUv7Rin0M
	9NybLlvvZ1T5u7GFdCIHWmzv1mGfOnLM62cQy4uIz93whgI8lckpmkR3UEqjuk0dtHAo
	d3eA==
X-Gm-Message-State: APjAAAUiK5MOMolX8O9eb2T2FeSfyZOymh1oa2wl5EdrEeaiOJQRumFi
	ytM82gqhKNfl980lVvEGaCowhc/CGgoHCDVOFIs=
X-Google-Smtp-Source: APXvYqyz5D2ExJqLF8IgqivapjYXzOhUz1k6GWk/e/rE20GM4qdFusyulwHj9R/uZPLrDWZ2NCC+37New78NJexUnkw=
X-Received: by 2002:a6b:3c04:: with SMTP id k4mr12754617iob.110.1573410271227; 
	Sun, 10 Nov 2019 10:24:31 -0800 (PST)
MIME-Version: 1.0
References: <20191107205914.10611-1-deepa.kernel@gmail.com>
	<1672a5861c82c2e3c0c54b5311fd413a8eee5e64.camel@infradead.org>
	<8D8B600C3EC1B64FAD4503F0B66C61F23BB95B@SHSMSX103.ccr.corp.intel.com>
	<addba4e401c3bf23b86cf8dff97256282895e29f.camel@infradead.org>
	<8D8B600C3EC1B64FAD4503F0B66C61F23BBA24@SHSMSX103.ccr.corp.intel.com>
	<CABeXuvoiX639HchLbgTHLiXPh=Yr2dJHUp2Yqc6pNJ3As1OJ8A@mail.gmail.com>
In-Reply-To: <CABeXuvoiX639HchLbgTHLiXPh=Yr2dJHUp2Yqc6pNJ3As1OJ8A@mail.gmail.com>
From: Deepa Dinamani <deepa.kernel@gmail.com>
Date: Sun, 10 Nov 2019 10:24:19 -0800
Message-ID: <CABeXuvqMpXbSNasET4-u16Hrj710fe-V706tsFZhOTJoir8Xjw@mail.gmail.com>
Subject: Re: [PATCH] intel-iommu: Turn off translations at shutdown
To: "Zeng, Jason" <jason.zeng@intel.com>
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: "Tian, Kevin" <kevin.tian@intel.com>, Arnd Bergmann <arnd@arndb.de>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>,
	Ron Minnich <rminnich@sandia.gov>, David Woodhouse <dwmw2@infradead.org>
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

On Fri, Nov 8, 2019 at 2:48 PM Deepa Dinamani <deepa.kernel@gmail.com> wrote:
>
> > > > For VMM live update case, we should be able to detect and bypass
> > > > the shutdown that Deepa introduced here, so keep IOMMU still operating?
> > >
> > > Is that a 'yes' to Deepa's "if someone wants to make it conditional, we
> > > can do that" ?
> >
> > Yes, I think so. Thanks!
>
> Are these changes already part of the kernel like avoiding shutdown of
> the passthrough devices? device_shutdown() doesn't seem to be doing
> anything selectively as of now.

I've posted the v2 without the conditional for now:
https://lore.kernel.org/patchwork/patch/1151225/

As a side topic, I'm trying to support https://www.linuxboot.org/. I
have a couple of more such cleanups coming. The VMM live updates and
linuxboot seem to have contradicting requirements and they both use
kexec. So kexec_in_progress doesn't seem like a sufficient indicator
to distinguish between the two. Do you already have an idea on how to
distiguish between them? Does a separate sys_reboot() command
parameter sound ok? Or, we could use the flags in the sys_kexec_load()
depending on how the live update feature is implemented.

-Deepa
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
