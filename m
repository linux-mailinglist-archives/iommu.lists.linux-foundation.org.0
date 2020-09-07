Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E03426057D
	for <lists.iommu@lfdr.de>; Mon,  7 Sep 2020 22:19:08 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id B546020763;
	Mon,  7 Sep 2020 20:19:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3ZwHNnxrzBW; Mon,  7 Sep 2020 20:19:05 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 0A18B2042B;
	Mon,  7 Sep 2020 20:19:04 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D28E2C0052;
	Mon,  7 Sep 2020 20:19:04 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 3B83AC0051
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 20:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 2A49085168
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 20:19:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eJiAnNVsSqph for <iommu@lists.linux-foundation.org>;
 Mon,  7 Sep 2020 20:19:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.7.6
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by whitealder.osuosl.org (Postfix) with ESMTPS id E2C1F86061
 for <iommu@lists.linux-foundation.org>; Mon,  7 Sep 2020 20:19:01 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id z25so14849088iol.10
 for <iommu@lists.linux-foundation.org>; Mon, 07 Sep 2020 13:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tcd-ie.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V6SpnhZsf85q4UgRCG3Vo1DStgFyYS4tfVeyEumkN/w=;
 b=GgswrjSOmPdUZ/BwDCdcWalN4y5WoQPbMec/SdCWEVJcYKNu64D9s8oHItvqe5USmk
 9DzBKzjfZOYqkrFvd6uDgVBqFvLBcAp47ZAw2Gj9EBRXq4IYQ8JUK1GLjOo/E7oSVx/O
 VKNWeMREdjMFPxlkxzHpkQGznhdwAw2yq006+gGaYPeW7M8JmCFrH1Ja3sTOnkVYMYMl
 oJJ5Hxuz82AiRLoFxOJuRTyoERq0vzrpvKHe4mhB/oAwd4qJyrGo/Ie4XZrMjCFsb+Gz
 +YX46uxsLhKyjMfnYvlZ7dlL4eBmh2LnQCxNxzzQSAZANFCzqDmoNh71XxL/lx44mEYD
 XfnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V6SpnhZsf85q4UgRCG3Vo1DStgFyYS4tfVeyEumkN/w=;
 b=BIyIbCQf1z0ohKmO0Q5ZzmKNXtgiK+VIhdds0JXR+VikNBpDfDcg7Us5wfyRqXe0xI
 fPhEWh7EvEQwE1yA7+LY/uva3NBxKTj+vcg3vY2zdl1OS4c2hULlk2Qc5rN5BYY8Pp50
 YPckgMfKOgntlpGad4Q79AV7u18k8iDDrYeQJgBegjTjdmlVpUMT0RmMlCD3yTmwmh6z
 6t0BhOcyszW31LkUt6xAxQusoCJIsxwWOnV5QEyCplVWkMWbpwhEWTuxdz7csiAfew5R
 ktjW0cG6Pb/gIEJOb/9CVw7fP5HHlRdTw3ETx2xRyg50tNs5JdkpBi8w73YuvOoV5EAR
 hISQ==
X-Gm-Message-State: AOAM530wFAwGUP9ba/E07bbZ9+jI6UBKwXzqSePIqlbuf9fjdda3oPN6
 9omjkdeEmt0jnUFv3UicbBFMp9QlXVa6QiJCn5q+yw==
X-Google-Smtp-Source: ABdhPJzwhdIL/3axB52LwFoeoHQzxXf0VSwxulEuEKbcmU9BKXPq4QXupZG6DlbYmrUcNskmfspcKM2Ls6KufI/R4cc=
X-Received: by 2002:a02:4b07:: with SMTP id q7mr6204438jaa.84.1599509940899;
 Mon, 07 Sep 2020 13:19:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200903201839.7327-1-murphyt7@tcd.ie>
 <20200903201839.7327-6-murphyt7@tcd.ie>
 <20200907070035.GA25114@infradead.org>
In-Reply-To: <20200907070035.GA25114@infradead.org>
From: Tom Murphy <murphyt7@tcd.ie>
Date: Mon, 7 Sep 2020 21:18:50 +0100
Message-ID: <CALQxJute8_y=JsW4UV1awSccOjxT_1OyPdymq=R_PurVQzENeQ@mail.gmail.com>
Subject: Re: [PATCH V2 5/5] DO NOT MERGE: iommu: disable list appending in
 dma-iommu
To: Christoph Hellwig <hch@infradead.org>
Cc: intel-gfx@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>, iommu@lists.linux-foundation.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Woodhouse <dwmw2@infradead.org>
X-BeenThere: iommu@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
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
Errors-To: iommu-bounces@lists.linux-foundation.org
Sender: "iommu" <iommu-bounces@lists.linux-foundation.org>

On Mon, 7 Sep 2020 at 08:00, Christoph Hellwig <hch@infradead.org> wrote:
>
> On Thu, Sep 03, 2020 at 09:18:37PM +0100, Tom Murphy wrote:
> > Disable combining sg segments in the dma-iommu api.
> > Combining the sg segments exposes a bug in the intel i915 driver which
> > causes visual artifacts and the screen to freeze. This is most likely
> > because of how the i915 handles the returned list. It probably doesn't
> > respect the returned value specifying the number of elements in the list
> > and instead depends on the previous behaviour of the intel iommu driver
> > which would return the same number of elements in the output list as in
> > the input list.
>
> So what is the state of addressing this properly in i915?  IF we can't

I think this is the latest on addressing this issue:
https://patchwork.kernel.org/cover/11306999/

tl;dr: some people seem to be looking at it but I'm not sure if it's
being actively worked on

> get it done ASAP I wonder if we need a runtime quirk to disable
> merging instead of blocking this conversion..

Yeah we talked about passing an attr to map_sg to disable merging at
the following microconfernce:
https://linuxplumbersconf.org/event/7/contributions/846/
As far as I can remember everyone seemed happy with that solution. I
won't be working on this though as I don't have any more time to
dedicate to this. It seems Lu Baolu will take over this.
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
