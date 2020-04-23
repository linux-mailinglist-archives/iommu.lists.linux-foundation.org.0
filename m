Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F3B1B5DE5
	for <lists.iommu@lfdr.de>; Thu, 23 Apr 2020 16:35:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9653588289;
	Thu, 23 Apr 2020 14:35:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Aya-B7hfxFZS; Thu, 23 Apr 2020 14:35:49 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id 81AE18829A;
	Thu, 23 Apr 2020 14:35:49 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 6B0ADC0175;
	Thu, 23 Apr 2020 14:35:49 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 2B657C1D87
 for <iommu@lists.linux-foundation.org>; Thu, 23 Apr 2020 14:35:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id 1833088289
 for <iommu@lists.linux-foundation.org>; Thu, 23 Apr 2020 14:35:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsRzKOrbfSxE for <iommu@lists.linux-foundation.org>;
 Thu, 23 Apr 2020 14:35:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ua1-f67.google.com (mail-ua1-f67.google.com
 [209.85.222.67])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 59D8288273
 for <iommu@lists.linux-foundation.org>; Thu, 23 Apr 2020 14:35:47 +0000 (UTC)
Received: by mail-ua1-f67.google.com with SMTP id i22so5862758uak.6
 for <iommu@lists.linux-foundation.org>; Thu, 23 Apr 2020 07:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=txoUP4TZL/kX6wzTvIyyPM8Tw98hlNv8TkS19LKzzNo=;
 b=Wkr0bymDg39KvhwGQedoiURyuP/SArfM/9lbpXIi1kmydOSd5DW7q2QV6F+YHrIzDQ
 JTwKM1kQFW1Ecz6bwK0sChfkdhZMNRukeEymx9JDsupFdDqi7m2c9kbHgwU1rbDm7JyF
 RDOjDH5tbRA+5Rrd8iV3L/pXJmss/r1qVJCMM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=txoUP4TZL/kX6wzTvIyyPM8Tw98hlNv8TkS19LKzzNo=;
 b=umrPz1GN4f7LEVRbdRYHBjGYYUbse1siv2DKWEZvuTShfifwqQRvxxIwQctk64nCFA
 LqUKztxzXlNga88t40qjxMFa4OjZ9g/NDce8L8lqiTyjSZP2ikOhpTiGZJjofpmwI39+
 pIFVgHn6h1a/ir/4y5TzKRXKYkYsTYhMiVDfHZ0FkLyxCgyImg4ryCmTIvgXbAwxDxEi
 Q+GQBsIXfnm0NGtmlG4vjMVeYARtVMTRYAEw3w92Tz4xzWXg/Y+Hsw4TdQkVg/hiePYn
 jpIQeJLhFRGHfPIaXCsL9pwgo69Y4kkR20K3OBH8GBxgxCxge/K7kkKwC4GBPv2NZZqy
 6rMw==
X-Gm-Message-State: AGi0PuYB2US1w6s+mHIb21oKwidiFOM5yvCeAJYYni2bLs5DpvRfr/R5
 gJ3XkEVu6t/yzbSMBX0J/tVatdeDwcU=
X-Google-Smtp-Source: APiQypJhjwwI1bAbXMr69P9/r34xrMHfBJx5pOGa6yoxWU7fp8FhTMrkhCKPlHEXOGK+hYlpvPfDqw==
X-Received: by 2002:a67:fe09:: with SMTP id l9mr3257846vsr.176.1587652545999; 
 Thu, 23 Apr 2020 07:35:45 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com.
 [209.85.222.42])
 by smtp.gmail.com with ESMTPSA id c195sm751297vke.25.2020.04.23.07.35.44
 for <iommu@lists.linux-foundation.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Apr 2020 07:35:45 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id c17so5855832uae.12
 for <iommu@lists.linux-foundation.org>; Thu, 23 Apr 2020 07:35:44 -0700 (PDT)
X-Received: by 2002:a67:f5d6:: with SMTP id t22mr1333288vso.73.1587652544353; 
 Thu, 23 Apr 2020 07:35:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
In-Reply-To: <20200423095531.9868-1-saiprakash.ranjan@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 23 Apr 2020 07:35:32 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
Message-ID: <CAD=FV=W=d=KrTwgMOO-ukFc7ZhkE92qGYumUEDrtjmhQOpdWbg@mail.gmail.com>
Subject: Re: [PATCHv2] iommu/arm-smmu: Make remove callback message more
 informative
To: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Cc: Will Deacon <will@kernel.org>, LKML <linux-kernel@vger.kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
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

Hi,

On Thu, Apr 23, 2020 at 2:55 AM Sai Prakash Ranjan
<saiprakash.ranjan@codeaurora.org> wrote:
>
> Currently on reboot/shutdown, the following messages are
> displayed on the console as error messages before the
> system reboots/shutdown as part of remove callback.
>
> On SC7180:
>
>   arm-smmu 15000000.iommu: removing device with active domains!
>   arm-smmu 5040000.iommu: removing device with active domains!
>
> Make this error message more informative and less scary.
>
> Reported-by: Douglas Anderson <dianders@chromium.org>
> Suggested-by: Robin Murphy <robin.murphy@arm.com>
> Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
> ---
>  drivers/iommu/arm-smmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
