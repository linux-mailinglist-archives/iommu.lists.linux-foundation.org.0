Return-Path: <iommu-bounces@lists.linux-foundation.org>
X-Original-To: lists.iommu@lfdr.de
Delivered-To: lists.iommu@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id C89DE281116
	for <lists.iommu@lfdr.de>; Fri,  2 Oct 2020 13:15:57 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 86FD086432;
	Fri,  2 Oct 2020 11:15:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Fl5MyXWCptXh; Fri,  2 Oct 2020 11:15:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id C1E2286403;
	Fri,  2 Oct 2020 11:15:54 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id AAC3EC0051;
	Fri,  2 Oct 2020 11:15:54 +0000 (UTC)
X-Original-To: iommu@lists.linux-foundation.org
Delivered-To: iommu@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C1981C0051
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 11:15:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 843A7273CF
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 11:15:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wc5wnVVmiWVq for <iommu@lists.linux-foundation.org>;
 Fri,  2 Oct 2020 11:15:48 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mail-ej1-f66.google.com (mail-ej1-f66.google.com
 [209.85.218.66])
 by silver.osuosl.org (Postfix) with ESMTPS id 7E98F204CA
 for <iommu@lists.linux-foundation.org>; Fri,  2 Oct 2020 11:15:48 +0000 (UTC)
Received: by mail-ej1-f66.google.com with SMTP id p15so1403885ejm.7
 for <iommu@lists.linux-foundation.org>; Fri, 02 Oct 2020 04:15:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=LHccXthzZpowujFlX/UIRlonuBGP7oxIKyYm0qA4pvg=;
 b=MWUu3rGAVicIgbKp7gMCe5ZvNy8WfqsWbpAvsXh0sisYv2z4Lg595oaplG3YTkDK/I
 xhL4Qy8ADy+cVNIDrn4yP+E859Y9hkb3YmEFq2ZNmKmcxg+Fq5p3IG19ICyjt7BmKGVo
 cjE4C3JgK+gVynAUwXUyOzgEg3384DHfhPscrmP9/Q/EvX+pPF4svne9n0lYPoXKaj1B
 t25Y7gZDWM5eLed2xDEAl0rUwzflDasc4SSTbWW8m6EucxTby+NWopUYrSWcfEBVltrm
 dVjUiVfmn3odYOtfZH+bfu+KDOpbDpSgtWtQRnow1cPcwwfNotMM72/nGbMNaquvea4l
 cjMg==
X-Gm-Message-State: AOAM530QKzk2JEq0eLvGSL+ePV+Noa0CefQ7qtqk7MlYDyXpYX1WPhz3
 QxexiUT12GuqQJdgXZqePtA=
X-Google-Smtp-Source: ABdhPJzSZOSHhDhVdKKucPu1ITBef6j4ONzNmUa9XEdo6BcAOHABAtdMC5eowTZhVkiFyKCfXv3VoQ==
X-Received: by 2002:a17:906:cf9b:: with SMTP id
 um27mr1735440ejb.66.1601637347031; 
 Fri, 02 Oct 2020 04:15:47 -0700 (PDT)
Received: from pi3 ([194.230.155.194])
 by smtp.googlemail.com with ESMTPSA id bt19sm934515ejb.44.2020.10.02.04.15.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2020 04:15:45 -0700 (PDT)
Date: Fri, 2 Oct 2020 13:15:43 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yong Wu <yong.wu@mediatek.com>
Subject: Re: [PATCH v3 24/24] memory: mtk-smi: Add mt8192 support
Message-ID: <20201002111543.GA7227@pi3>
References: <20200930070647.10188-1-yong.wu@mediatek.com>
 <20200930070647.10188-25-yong.wu@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200930070647.10188-25-yong.wu@mediatek.com>
Cc: youlin.pei@mediatek.com, devicetree@vger.kernel.org,
 kernel-team@android.com, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, chao.hao@mediatek.com,
 Robin Murphy <robin.murphy@arm.com>, Greg Kroah-Hartman <gregkh@google.com>,
 linux-kernel@vger.kernel.org, Evan Green <evgreen@chromium.org>,
 Tomasz Figa <tfiga@google.com>, iommu@lists.linux-foundation.org,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, ming-fan.chen@mediatek.com,
 anan.sun@mediatek.com, Will Deacon <will@kernel.org>,
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

On Wed, Sep 30, 2020 at 03:06:47PM +0800, Yong Wu wrote:
> Add mt8192 smi support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)

Does it depend on any of the previous patches (so can it be applied
independently)?

Best regards,
Krzysztof
_______________________________________________
iommu mailing list
iommu@lists.linux-foundation.org
https://lists.linuxfoundation.org/mailman/listinfo/iommu
