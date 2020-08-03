Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id C3CA823B14E
	for <lists.iommu@lfdr.de>; Tue,  4 Aug 2020 01:58:01 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id 740222154C;
	Mon,  3 Aug 2020 23:58:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7-rZL97DlPZx; Mon,  3 Aug 2020 23:57:59 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 850A2204F1;
	Mon,  3 Aug 2020 23:57:59 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 70F8DC004C;
	Mon,  3 Aug 2020 23:57:59 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 6D449C004C
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 23:57:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 551C32154C
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 23:57:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zAPXpIlgoRI0 for <iommu@lists.linux-foundation.org>;
 Mon,  3 Aug 2020 23:57:56 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com
 [209.85.218.67])
 by silver.osuosl.org (Postfix) with ESMTPS id 6107D204F1
 for <iommu@lists.linux-foundation.org>; Mon,  3 Aug 2020 23:57:56 +0000 (UTC)
Received: by mail-ej1-f67.google.com with SMTP id f24so19966368ejx.6
 for <iommu@lists.linux-foundation.org>; Mon, 03 Aug 2020 16:57:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=VMA09kDi+I3IIST6piBhLUjJZLHB1GtkxXf1OiQUwTs=;
 b=WrUsbEZbGOZEljnf7MPZ0+EI0k6MtomEbVYGqwLSE3s6AnUcQRbI8LTZ92C6KnxNYW
 /X7cMPSkna7QFLrOkx6aO1Fu2IOmS3Va3mgvnfhnPlAm9CShkEhaZxSxgikCsmlv6L8F
 PdVnMksaW3eafBMeWAZc17ZBNPtM6fAzrVyvl4UKwh2/5a61uzEXTpyK85N8a2BKaRnT
 GWXMbjQI1IPHAxvhax113tYcwQzK7VnVY2o4RQKnt76Cafy2fa3OmSqjyXnhAaZK3w9u
 byfXw628My0LWJIv8Oc8rMPddZyZvAF3uCpj3DGD2yPt4eRZhv6jlZoe7AJ0wwaxmcZ6
 5zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=VMA09kDi+I3IIST6piBhLUjJZLHB1GtkxXf1OiQUwTs=;
 b=HxM2bRQT/nL3m9SbEaFDhcBK7Zy2O54AKSCoJkENvFTLyPCHqIjcCf3hgPFGP80RlW
 EkdycL3xmRQvD3qvlbb+pt4Gy7QBFPpViHQ2hWVi4rLx6KdX3aNWJ9YBsnDQkzCy6Cyv
 rxT0itzcTanwmhh5oNRcGAqVGhAp8uQdfYk4mAjJqDWSR1fHi8YvMjugqjF+kj863M9S
 9oD+UwRgFruSPkfA5aVOJxcT6M3DQS16ED/VTZxdQF13ROExVPA8JJOJuDj4FFNbYjpe
 EZVurNpwQq3jVni/agvjULZGl59KT9x7XvJuqDlnZ0wu1pKhOx98m1h6N9QaGPuDtT5E
 Be1A==
X-Gm-Message-State: AOAM533G7BfHxnzUq3ZeEFeAJvVm74ReyWCWOHUEn860W5S5cMmaBzFU
 acFYwKMRFIdWEDonK5EAYUiJO1je0rQLqOB0LfE=
X-Google-Smtp-Source: ABdhPJyQ9PQkQYqnDZgpkDFgKb26BXg8I7qq9H3w6LUADliDEzsyoI0sHJIf2u6KBx6hIP6L1K0UdUVJizMmgnZP7OM=
X-Received: by 2002:a17:906:3e4f:: with SMTP id
 t15mr20173574eji.368.1596499074909; 
 Mon, 03 Aug 2020 16:57:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200704122809.73794-1-konradybcio@gmail.com>
 <20200704130922.GB21333@willie-the-truck>
 <20200705033511.GR388985@builder.lan>
 <CAMS8qEWO-1mNd12Zs-2WogCrgNF5=6RkF=Z1pTeOZxSuKjx+qg@mail.gmail.com>
 <20200721154415.GA5758@jcrouse1-lnx.qualcomm.com>
 <CAMS8qEXNh6n9SpMkPAr8cPneasPvJPELD2TZ4gxUf0byxNePbg@mail.gmail.com>
 <20200721235650.GN388985@builder.lan>
 <CAMS8qEVXGddTdbrPwK3NJMx71HH0hoVyqiJG6-g9tiBRMRYZ8w@mail.gmail.com>
 <20200731054850.GA20825@builder.lan>
In-Reply-To: <20200731054850.GA20825@builder.lan>
From: Konrad Dybcio <konradybcio@gmail.com>
Date: Tue, 4 Aug 2020 01:57:19 +0200
Message-ID: <CAMS8qEVmSK=FQyTVCOkF6HX_2PAfr5oJ+Fo=QkRV1Cd15bo3Xw@mail.gmail.com>
Subject: Re: [PATCH 1/1] iommu/arm-smmu: Implement qcom,skip-init
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Cc: DTML <devicetree@vger.kernel.org>, skrzynka@konradybcio.pl,
 Will Deacon <will@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 iommu@lists.linux-foundation.org, Rob Herring <robh+dt@kernel.org>,
 John Stultz <john.stultz@linaro.org>, Robin Murphy <robin.murphy@arm.com>,
 linux-arm-kernel@lists.infradead.org
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

> Sounds like things are progressing nicely for a while there, presumably
> until the next time the display is being refreshed.
>
> Would you be willing to try out the following work in progress:
> https://lore.kernel.org/linux-arm-msm/20200717001619.325317-1-bjorn.andersson@linaro.org/

I sure would like to if you could be kind enough to tell me which tree
I should apply it against. Latest -next brought some changes to
drivers/iommu/ structure which makes this not apply at all :/

Konrad
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
