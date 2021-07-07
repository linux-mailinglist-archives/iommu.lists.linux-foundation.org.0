Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 50FF83BE266
	for <lists.iommu@lfdr.de>; Wed,  7 Jul 2021 07:13:03 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E06FD40121;
	Wed,  7 Jul 2021 05:13:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6iSGhCnYUSQ; Wed,  7 Jul 2021 05:13:01 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTPS id 10E074049F;
	Wed,  7 Jul 2021 05:13:01 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id D9F5CC001F;
	Wed,  7 Jul 2021 05:13:00 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 192DCC000E
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 05:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 066F840506
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 05:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=linaro.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kQNS6b9sK7tl for <iommu@lists.linux-foundation.org>;
 Wed,  7 Jul 2021 05:12:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 84A0140580
 for <iommu@lists.linux-foundation.org>; Wed,  7 Jul 2021 05:12:57 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id p24so1103998ljj.1
 for <iommu@lists.linux-foundation.org>; Tue, 06 Jul 2021 22:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tbekPJYhk51AiCb/jp2mDu1SGe+rJ18xe7z1A6805jM=;
 b=fe4Ocl93rz7pECRQ1CotlTG3DMZJWB6KbfvEAGDDz0pOLoDd2Czs1C0Q4gG/WnxjWt
 Ha8o6slBnBLB7Qo6BIky+i7Zh+Q0BxgBpPGfZogc4KGXDNwc1AkFN4hh6k8V/l704Dw7
 VRjZ8Ju1F//y4ZLQyIKuT5gvxcdgpp117aEO/EzjqJDt968i7gZdxIZ3x7gtgnhffLQW
 vEwORBnDSzBQHh8yo4L+R4a1uV43BNTtsgrIDsCumj1nGDqr5juzpDznHSwSYOWhQjKM
 Cd+wjmNzLuYNzLJznG0bn+vtfDqtg0IKN56SXueZKGTMkAsKYLVfANKfcE0CXCTJbLHp
 h7Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tbekPJYhk51AiCb/jp2mDu1SGe+rJ18xe7z1A6805jM=;
 b=mHlPhE5OztVP/Zjd766xFYZPvR8EC3KdXXxnJm1cQncAU5YfL7hW3FrjPmyGfk+nqw
 d4xLfFrXwuCncS37UkhvH9SXeR0vpTIKRNYDcVFCcktDELWEruxTD8ZFsw9RQIjUkIZe
 ZDw5kKLo7GEHq1G7wd1nap2tcG28xfRFwzvOq1PzOfwJGF0eHuJ/7C9d7qUFSvMr+8CG
 pWnY9HghCamPLK+MRi+IYxyERxOfvSmXytf94kRf8NpfGflixpRrWKkziz2tqzfCzfjI
 Z9AX5SUZJghGXYzO7t2XbG3QAx+dh/5nZ8ZbU1rZePSWmmiLtLdn2s81uTQhyDNolBlu
 4UPw==
X-Gm-Message-State: AOAM531GTJLleBrLPKW1LqeaMwnNONqGlLz5D+Gpg6mmhGDHbhE88Er/
 pxdfn/FVBQuh2483yx9VuD8MkugNHYO8t4czdyNvXg==
X-Google-Smtp-Source: ABdhPJxbc3+AxHLhFeAT5cU6slD5V2CJU2jO01d5xbmQ1yKB7QPxdlU4achffWzuXV4bC2pvaZA0xymSpnPwlr5oNvE=
X-Received: by 2002:a05:651c:2c1:: with SMTP id
 f1mr3244451ljo.128.1625634775403; 
 Tue, 06 Jul 2021 22:12:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210610214431.539029-1-robdclark@gmail.com>
 <2016473f-2b38-f049-1e8d-04bdf5af6cea@linaro.org>
 <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
In-Reply-To: <CAF6AEGu6Wt+FDh_Kp8GrZB9TV7ufTuidmqBfkzA9rcCJc7zSQQ@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Tue, 6 Jul 2021 22:12:47 -0700
Message-ID: <CALAqxLWDqQeD-eieHXtePuXpxN1s3=jCNJP2pJD-YswsLP-mJw@mail.gmail.com>
Subject: Re: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
To: Rob Clark <robdclark@gmail.com>
Cc: Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>, Eric Anholt <eric@anholt.net>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Lee Jones <lee.jones@linaro.org>, Rob Clark <robdclark@chromium.org>,
 Jonathan Marek <jonathan@marek.ca>, Will Deacon <will@kernel.org>,
 Zhenzhong Duan <zhenzhong.duan@gmail.com>, Joerg Roedel <jroedel@suse.de>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
 "Isaac J. Manjarres" <isaacm@codeaurora.org>,
 Robin Murphy <robin.murphy@arm.com>, Douglas Anderson <dianders@chromium.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>,
 "Kristian H. Kristensen" <hoegsberg@google.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>
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

On Sun, Jul 4, 2021 at 11:16 AM Rob Clark <robdclark@gmail.com> wrote:
>
> I suspect you are getting a dpu fault, and need:
>
> https://lore.kernel.org/linux-arm-msm/CAF6AEGvTjTUQXqom-xhdh456tdLscbVFPQ+iud1H1gHc8A2=hA@mail.gmail.com/
>
> I suppose Bjorn was expecting me to send that patch

If it's helpful, I applied that and it got the db845c booting mainline
again for me (along with some reverts for a separate ext4 shrinker
crash).
Tested-by: John Stultz <john.stultz@linaro.org>

thanks
-john
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
